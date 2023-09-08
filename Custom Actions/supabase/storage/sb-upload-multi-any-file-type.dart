// YouTube channel - https://www.youtube.com/@flutterflowexpert
// video - https://www.youtube.com/watch?v=H4YBcAb7XxY
// widgets - Cg9Db2x1bW5fOG95emxwMTQS7gEKD0J1dHRvbl92djM1emhrdxgJInxKdwojCgtVcGxvYWQgZmlsZToGCP////8PQAV6ChIINWdhYnJyMTQZAAAAAAAAAEApAAAAAABAYEAxAAAAAAAAREBJAAAAAAAA8D9SAhABWgIIAHIkCQAAAAAAACBAEQAAAAAAACBAGQAAAAAAACBAIQAAAAAAACBA+gMAYgCKAVgSUgoIcXNmMGg3NjMSRtIBOAoaChF1cGxvYWRBbnlGaWxlVHlwZRIFaDhhMnESGhIYCAxCFCISCg4KDGFyZ0ZpbGVUeXBlcxABqgIIeWc4cXg1em4aAggBGAQiGyICEAFyEgkAAAAAAAAAABEAAAAAAAAAAPoDAA==
// Join the Klaturov army - https://www.youtube.com/@flutterflowexpert/join
// Support my work - https://github.com/sponsors/bulgariamitko
// Website - https://bulgariamitko.github.io/flutterflowtutorials/
// You can book me as FF mentor - https://calendly.com/bulgaria_mitko
// GitHub repo - https://github.com/bulgariamitko/flutterflowtutorials
// Discord channel - https://discord.gg/ERDVFBkJmY

import '../../flutter_flow/upload_data.dart';

Future uploadAnyFileType(
  BuildContext context,
  List<String>? fileType,
  String? bucket,
  String? folderPath,
) async {
  // null safety
  fileType ??= ['pdf'];
  bucket ??= 'error';
  folderPath ??= 'error';

  SelectedFile selectedFile = await selectFile(
          storageFolderPath: folderPath, allowedExtensions: fileType) ??
      SelectedFile(bytes: Uint8List(0));
  showUploadMessage(
    context,
    'Uploading file...',
    showLoading: true,
  );

  final String downloadUrl = await uploadSupabaseStorageFile(
      bucketName: bucket, selectedFile: selectedFile);

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  // save url to local state
  FFAppState().update(() {
    FFAppState().filePath = downloadUrl;
  });

  showUploadMessage(
    context,
    'Success!',
  );
}

