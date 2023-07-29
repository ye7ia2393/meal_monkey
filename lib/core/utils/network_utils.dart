import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/enums/request_type.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request -----
      //*--- Make full api url -----
      var uri = Uri.https(baseUrl, url, params);

      //?--- To Save api response -----
      late http.Response response;

      //!--- Required convert api response to Map -----
      Map<String, dynamic> jsonResponse = {};

      //*--- Make call correct request type -----

      switch (requestType) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
              await client.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              headers: headers, body: jsonEncode(body));
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
      } catch (e) {}

      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      jsonResponse.putIfAbsent(
        'response',
        () => result ?? {'title': Utf8Codec().decode(response.bodyBytes)},
      );

      return jsonResponse;
    } catch (e) {
      print(e);
      CustomToast.showMessage(
        message: e.toString(),
        messageType: MessageType.WARNING,
      );
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required RequestType requestType,
    required String url,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var request = http.MultipartRequest(
        requestType.name,
        Uri.https(baseUrl, url, params),
      );

      var _filesKeyList = files!.keys.toList();
      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }

      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();
      Map<String, dynamic> responseJson = {};
      dynamic value;

      try {
        value = await response.stream.bytesToString();
      } catch (e) {}

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent(
          'response',
          () => value is String
              ? {'title': value}
              // () => value == "" && response.statusCode == 200
              //     ? {'title': 'Register Successful!'}
              : jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

//////////////////////////////////////////////////////////////////

  // static MediaType getContentType(String fileName) {
  //   // var fileExtension = fileName.split('.').last;
  //   var fileExtension = path.extension(fileName);
  //   var fileType;
  //   MediaType x;

  //   if (fileExtension == "png" || fileExtension == "jpeg") {
  //     return MediaType.parse("image/jpg");
  //   } else if (fileExtension == 'pdf') {
  //     return MediaType.parse("application/pdf");
  //   } else {
  //     return MediaType.parse("image/jpg");
  //   }
  // }

  static Map<String, MediaType> fileTypeToMediaType = {
    'jpeg': MediaType.parse('image/jpeg'),
    'png': MediaType.parse('image/png'),
    'pdf': MediaType.parse('application/pdf'),
    'doc': MediaType.parse('application/msword'),
    'docx': MediaType.parse('application/msword'),
    'xls': MediaType.parse('application/vnd.ms-excel'),
    'xlsx': MediaType.parse('application/vnd.ms-excel'),
    'unknown': MediaType.parse('application/octet-stream'),
  };

  static MediaType getContentType(String fileName) {
    var fileExtension = fileName.split('.').last;

    switch (fileExtension) {
      case 'jpg':
      case 'jpeg':
        return fileTypeToMediaType['jpeg']!;
      case 'png':
        return fileTypeToMediaType['png']!;
      case 'pdf':
        return fileTypeToMediaType['jpeg']!;
      case 'doc':
      case 'docx':
        return fileTypeToMediaType['doc']!;
      case 'xls':
      case 'xlsx':
        return fileTypeToMediaType['xls']!;
      default:
        return fileTypeToMediaType['unknown']!;
    }
  }

  // static MediaType getContentTypeTwo(String fileName) {
  //   var fileExtension = fileName.split('.').last;
  //   FileTypeTest? fileTypeTest;
  //   switch (fileTypeTest) {
  //     case FileTypeTest.JPEG:
  //       break;
  //     case FileTypeTest.JPG:
  //       break;
  //     case FileTypeTest.PNG:
  //       break;
  //     case FileTypeTest.PDF:
  //       break;
  //     case FileTypeTest.DOC:
  //       break;
  //     case FileTypeTest.DOCX:
  //       break;
  //     case FileTypeTest.XLS:
  //       break;
  //     case FileTypeTest.XLSX:
  //       break;
  //     case FileTypeTest.UNKNOWN:
  //       break;
  //   }
  // }
  // static MediaType getContentType(String fileName) {
  //   var fileExtension = fileName.split('.').last;
  //   if (fileExtension == "png" || fileExtension == "jpeg") {
  //     return MediaType.parse("image/jpg");
  //   } else if (fileExtension == 'pdf') {
  //     return MediaType.parse("application/pdf");
  //   } else {
  //     return MediaType.parse("image/jpg");
  //   }
  // }
}


// enum FileTypeTest {
//   JPEG("image/jpg"),
//   JPG("image/jpg"),
//   PNG("image/png"),
//   PDF("application/pdf"),
//   DOC("application/msword"),
//   DOCX("application/msword"),
//   XLS("application/vnd.ms-excel"),
//   XLSX("application/vnd.ms-excel"),
//   UNKNOWN("application/octet-stream");

//   const FileTypeTest(this.value);
//   final MediaType MediaType.parse("image/jpg");
// }