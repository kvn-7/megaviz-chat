import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/chat/data/models/chat/chat_dto.dart';

class ChatRemoteDataSource {
  final FirebaseFirestore _firestore;

  ChatRemoteDataSource() : _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _chatsCollection() {
    return _firestore.collection('chats');
  }

  CollectionReference<Map<String, dynamic>> _messagesCollection() {
    return _firestore.collection('messages');
  }

  CollectionReference<Map<String, dynamic>> _usersCollection() {
    return _firestore.collection('users');
  }

  String? _getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Either<AppException, Stream<List<ChatDto>>> getChatsStream() {
    try {
      final stream = _chatsCollection()
          .where('participantIds', arrayContains: _getUserId())
          .snapshots()
          .map((snapshot) {
            return snapshot.docs
                .map(
                  (doc) => ChatDto.fromJson({
                    ...doc.data(),
                    'id': doc.id,
                    'userId': (doc.data()['participantIds'] as List<dynamic>)
                        .map((id) => id as String)
                        .where((id) => id != _getUserId())
                        .firstOrNull,
                  }),
                )
                .toList();
          });

      return Right(stream);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get chats stream: ${e.toString()}',
          statusCode: 500,
          identifier: 'getChatsStream',
        ),
      );
    }
  }

  Either<AppException, Stream<ChatMessageDto?>> getLastMessageStream(
    String chatId,
  ) {
    try {
      final stream = _messagesCollection()
          .where('chatId', isEqualTo: chatId)
          .orderBy('timestamp', descending: true)
          .limit(1)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) =>
                      ChatMessageDto.fromJson({...doc.data(), 'id': doc.id}),
                )
                .toList()
                .firstOrNull,
          );

      return Right(stream);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get last message stream: ${e.toString()}',
          statusCode: 500,
          identifier: 'getLastMessageStream',
        ),
      );
    }
  }

  Either<AppException, Stream<ChatUserDto?>> getChatUserStream(String userId) {
    try {
      final stream = _usersCollection().doc(userId).snapshots().map((snapshot) {
        if (snapshot.exists) {
          return ChatUserDto.fromJson(snapshot.data()!);
        }
        return null;
      });

      return Right(stream);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get chat user stream: ${e.toString()}',
          statusCode: 500,
          identifier: 'getChatUserStream',
        ),
      );
    }
  }

  Future<Either<AppException, SendMessageResDto>> sendMessage(
    SendMessageDto message,
  ) async {
    try {
      final chatId = message.chatId;

      final result = await addMessage(chatId, message.content);

      return result.mapRight(
        (messageId) => SendMessageResDto(chatId: chatId, messageId: messageId),
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to send message: ${e.toString()}',
          statusCode: 500,
          identifier: 'sendMessage',
        ),
      );
    }
  }

  Future<Either<AppException, String>> addChat(String userId) async {
    try {
      final docRef = await _chatsCollection().add({
        'participantIds': [_getUserId(), userId],
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return Right(docRef.id);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to add chat: ${e.toString()}',
          statusCode: 500,
          identifier: 'addChat',
        ),
      );
    }
  }

  Future<Either<AppException, String>> addMessage(
    String chatId,
    ChatMessageContentDto content,
  ) async {
    try {
      final docRef = await _messagesCollection().add({
        'chatId': chatId,
        'senderId': _getUserId(),
        'content': content.toJson(),
        'timestamp': FieldValue.serverTimestamp(),
        'isRead': false,
      });

      return Right(docRef.id);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to update chat: ${e.toString()}',
          statusCode: 500,
          identifier: 'updateChat',
        ),
      );
    }
  }

  Either<AppException, Stream<List<ChatUserDto>>>
  getAvailableChatUsersStream() {
    try {
      final stream = _usersCollection()
          .where('uid', isNotEqualTo: _getUserId())
          .snapshots()
          .map((snapshot) {
            return snapshot.docs
                .map((doc) => ChatUserDto.fromJson(doc.data()))
                .toList();
          });

      return Right(stream);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get available chat users: ${e.toString()}',
          statusCode: 500,
          identifier: 'getAvailableChatUsersStream',
        ),
      );
    }
  }

  Future<Either<AppException, ChatDto>> getOrCreateChat(String userId) async {
    try {
      final snapshot = await _chatsCollection()
          .where('participantIds', arrayContains: userId)
          .get();

      final currentUserId = _getUserId();

      final existingChatDoc = snapshot.docs.where((doc) {
        final participantIds = List<String>.from(doc['participantIds']);
        return participantIds.contains(currentUserId);
      }).firstOrNull;

      if (existingChatDoc != null) {
        return Right(
          ChatDto.fromJson({
            ...existingChatDoc.data(),
            'id': existingChatDoc.id,
            'userId': userId,
          }),
        );
      }

      final newChatId = await addChat(userId);

      return newChatId.fold(
        (left) => Left(left),
        (chatId) => Right(ChatDto(id: chatId, userId: userId)),
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get or create chat: ${e.toString()}',
          statusCode: 500,
          identifier: 'getOrCreateChat',
        ),
      );
    }
  }

  Either<AppException, Stream<List<ChatMessageDto>>> getMessagesStream(
    String chatId,
  ) {
    try {
      final stream = _messagesCollection()
          .where('chatId', isEqualTo: chatId)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) {
            return snapshot.docs
                .map(
                  (doc) =>
                      ChatMessageDto.fromJson({...doc.data(), 'id': doc.id}),
                )
                .toList();
          });

      return Right(stream);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get chats stream: ${e.toString()}',
          statusCode: 500,
          identifier: 'getChatsStream',
        ),
      );
    }
  }

  Future<Either<AppException, void>> markMessagesAsRead(String chatId) async {
    try {
      final batch = _firestore.batch();
      final messagesQuery = _messagesCollection()
          .where('chatId', isEqualTo: chatId)
          .where('isRead', isEqualTo: false)
          .where('senderId', isNotEqualTo: _getUserId());

      final messagesSnapshot = await messagesQuery.get();
      for (final doc in messagesSnapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();

      return Right(null);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to mark message as read: ${e.toString()}',
          statusCode: 500,
          identifier: 'markMessageAsRead',
        ),
      );
    }
  }
}
