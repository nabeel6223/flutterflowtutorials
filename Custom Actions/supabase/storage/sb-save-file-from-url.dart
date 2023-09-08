// YouTube channel - https://www.youtube.com/@flutterflowexpert
// video - no
// Join the Klaturov army - https://www.youtube.com/@flutterflowexpert/join
// Support my work - https://github.com/sponsors/bulgariamitko
// Website - https://bulgariamitko.github.io/flutterflowtutorials/
// You can book me as FF mentor - https://calendly.com/bulgaria_mitko
// GitHub repo - https://github.com/bulgariamitko/flutterflowtutorials
// Discord channel - https://discord.gg/ERDVFBkJmY

import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/upload_data.dart';

Future saveFileFromUrl(
  String? url,
  String? bucket,
  String? fullFilePath,
) async {
  // null safety
  url ??=
      'https://cdn.midjourney.com/8908a048-6e12-4431-9f8a-a70d1f6f4a56/0_2.png';
  bucket ??= 'error';
  fullFilePath ??= 'error';

// Download the file from the URL as bytes
  final fileAsBytes = await DownloadFileCall.call(
    url: url,
  );
  final Uint8List bytes = fileAsBytes.response!.bodyBytes;

  SelectedFile selectedFile =
      SelectedFile(storagePath: fullFilePath, bytes: bytes);

  final String downloadUrl = await uploadSupabaseStorageFile(
      bucketName: bucket, selectedFile: selectedFile);

  FFAppState().update(() {
    FFAppState().filePath = downloadUrl;
  });
}