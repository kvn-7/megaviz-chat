import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
// import 'package:megaviz_chat/src/features/media/presentation/providers/app_media_utils_provider.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class PdfPreviewParams {
  PdfPreviewParams({
    required this.title,
    this.pdfUrl,
    this.pdfBytes,
    this.horizontal = false,
  });

  final String title;
  final String? pdfUrl;
  final Uint8List? pdfBytes;
  final bool horizontal;
}

class PdfPreviewScreen extends ConsumerWidget {
  const PdfPreviewScreen({super.key, required this.params});

  final PdfPreviewParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Future<String?> getDownloadPath() async {
    //   if (Platform.isAndroid) {
    //     final androidInfo = await DeviceInfoPlugin().androidInfo;
    //     final sdkInt = androidInfo.version.sdkInt;

    //     // Handle permission request for Android 13 and above
    //     if (sdkInt > 29) {
    //       // Request the necessary permissions
    //       final status = await Permission.manageExternalStorage.request();
    //       if (status.isGranted) {
    //         final directory = Directory('/storage/emulated/0/Download');

    //         return directory.path;
    //       }
    //     } else {
    //       // Request general storage permission for Android versions below 13
    //       if (await Permission.storage.request().isGranted) {
    //         final directory = Directory('/storage/emulated/0/Download');

    //         return directory.path;
    //       }
    //     }
    //   } else if (Platform.isIOS) {
    //     final directory = await getApplicationDocumentsDirectory();
    //     return directory.path;
    //   }
    //   return null;
    // }

    // Future<void> downloadPressed() async {
    //   final downloadPath = await getDownloadPath();
    //   if (downloadPath == null) {
    //     return;
    //   }

    //   if (!context.mounted) return;

    //   final file = File(
    //     '$downloadPath/${params.title}',
    //   );

    //   var bytes = params.pdfBytes;

    //   bytes ??=
    //       await ref.read(appMediaUtilsProvider).downloadPdf(params.pdfUrl!);

    //   if (bytes == null) return;

    //   await file.writeAsBytes(bytes);

    //   if (!context.mounted) return;

    //   context.showSuccessSnackBar(context.appLocalizations.resumeDownloaded);
    // }

    // var isLoading = false;

    // Future<void> sharePdf() async {
    //   try {
    //     if (isLoading) return;

    //     isLoading = true;

    //     final bytes = params.pdfBytes;

    //     await Share.shareXFiles(
    //       [
    //         XFile.fromData(
    //           Uint8List.fromList(bytes!),
    //           name: params.title,
    //           mimeType: 'application/pdf',
    //         ),
    //       ],
    //       fileNameOverrides: [params.title],
    //     );

    //     isLoading = false;
    //   } catch (e) {
    //     return;
    //   }
    // }

    return AppScaffold(
      appBar: AppBar(
        title: AppText(text: params.title),
        // actions: [AppIcon(onPressed: sharePdf, path: AppAssets.share)],
      ),
      padding: EdgeInsets.zero,
      body: SfPdfViewerTheme(
        data: SfPdfViewerThemeData(
          backgroundColor: context.colorScheme.surface,
        ),
        child: params.pdfBytes != null
            ? SfPdfViewer.memory(
                Uint8List.fromList(params.pdfBytes!),
                scrollDirection: params.horizontal
                    ? PdfScrollDirection.horizontal
                    : PdfScrollDirection.vertical,
              )
            : SfPdfViewer.network(
                params.pdfUrl!,
                scrollDirection: params.horizontal
                    ? PdfScrollDirection.horizontal
                    : PdfScrollDirection.vertical,
              ),
      ),
    );
  }
}
