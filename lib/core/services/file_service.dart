import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../common/model/failure_model.dart';
import '../config/app_route.dart';

class FileService {
  Future<String> encodeFileInBackground({required String? filePath}) async {
    // compute spawns an isolate, runs a callback on that isolate, and returns a Future with the result
    return await compute(_encodeFileToBase64, filePath);
  }

Future pickFile(
  {FileType? fileType,
      List<String>? allowedExtensions,
      bool? allowMultiple,
      double? sizeMax}
) async {
  // Request storage permission
  var status = await Permission.storage.request();

  // Handle permission status
  if (status.isGranted) {
    // Permission granted, proceed with file picking
    final result = await FilePicker.platform.pickFiles( allowMultiple: allowMultiple ?? false,
        type: fileType ?? FileType.any,
        allowedExtensions: allowedExtensions,);
   try {
      File? selectedFile;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple ?? false,
        type: fileType ?? FileType.any,
        allowedExtensions: allowedExtensions,
      );
      if (result != null) {
        selectedFile = File(result.files.single.path!);

        String mimeType = lookupMimeType(selectedFile.path)!;
        var base64String =
            await encodeFileInBackground(filePath: selectedFile.path);
        final fileEncoded = 'data:$mimeType;base64,$base64String';
        return [selectedFile, fileEncoded];
      }
      return selectedFile;
    } on FailureModel {
      rethrow;
    } catch (e) {
      return e;
    }
      
  }
  Future<List<String>> encodeFilesInBackground(
      {required List<String?> filePath}) async {
    // compute spawns an isolate, runs a callback on that isolate, and returns a Future with the result
    return await compute(_encodeFilesToBase64, filePath);
  }

  Future uploadFile(
      {FileType? fileType,
      List<String>? allowedExtensions,
      bool? allowMultiple,
      double? sizeMax}) async {
    try {
      File? selectedFile;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple ?? false,
        type: fileType ?? FileType.any,
        allowedExtensions: allowedExtensions,
      );
      if (result != null) {
        selectedFile = File(result.files.single.path!);

        String mimeType = lookupMimeType(selectedFile.path)!;
        var base64String =
            await encodeFileInBackground(filePath: selectedFile.path);
        final fileEncoded = 'data:$mimeType;base64,$base64String';
        return [selectedFile, fileEncoded];
      }
      
   else if (status.isDenied) {
    // Permission denied, inform the user
    print('Storage permission denied');
    await showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => AlertDialog(
        title: Text('Storage Permission Required'),
        content: Text('This app requires storage permission to access files.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  } else {
    // Handle other permission status (limited, permanently denied)
    print('Storage permission status: ${status.toString()}');
  }
      return selectedFile;
    } on FailureModel {
      rethrow;
    } catch (e) {
      return e;
    }
  }

  double getFileSizeDouble({
    required int fileLength,
  }) {
    Logger().f(fileLength);
    double sizeInMb = fileLength / (1024 * 1024);
    return sizeInMb;
  }
}

Future<String> _encodeFileToBase64(String? filePath) async {
  final file = File(filePath!);
  final bytes = await file.readAsBytes();
  final base64Encoded = base64Encode(bytes);
  return base64Encoded;
}

Future<List<String>> _encodeFilesToBase64(List<String?> filePath) async {
  final List<File> files = List<File>.from(filePath.map((x) => File(x!)));
  List<Uint8List> bytes = [];
  List<String> base64Encoded = [];
  for (var v in files) {
    bytes.add(await v.readAsBytes());
  }
  for (var v in bytes) {
    var base = base64Encode(v);
    base64Encoded.add(base);
  }
  // final base64Encoded = base64Encode(bytes);
  return base64Encoded;
}
}

