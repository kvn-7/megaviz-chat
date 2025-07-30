import 'package:megaviz_chat/src/features/auth/data/sources/firebase_auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_data_source_provider.g.dart';

@riverpod
class FirebaseAuthDataSourceProvider extends _$FirebaseAuthDataSourceProvider {
  @override
  FirebaseAuthDatasource build() {
    return FirebaseAuthDatasource();
  }
}
