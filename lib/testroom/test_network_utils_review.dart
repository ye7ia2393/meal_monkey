// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/core/enums/request_type.dart';
// import 'package:meal_monkey/testroom/test_custom_toast.dart';

// class TestNetworkUtil {
//   static String baseUrl = 'training.owner-tech.com';
//   static var client = http.Client();

//   static Future<dynamic> sendRequest({
//     required RequestType requestType,
//     required String url,
//     Map<String, String>? headers,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? params,
//   }) async {
//     try {
//       //!--- Required for request -----
//       //*--- Make full api url -----
//       var uri = Uri.https(baseUrl, url, params);

//       //?--- To Save api response -----
//       late http.Response response;

//       //!--- Required convert api response to Map -----
//       Map<String, dynamic> jsonResponse = {};

//       //*--- Make call correct request type -----

//       switch (requestType) {
//         case RequestType.GET:
//           response = await client.get(uri, headers: headers);
//           break;
//         case RequestType.POST:
//           response =
//               await client.post(uri, headers: headers, body: jsonEncode(body));
//           break;
//         case RequestType.PUT:
//           response =
//               await client.put(uri, headers: headers, body: jsonEncode(body));
//           break;
//         case RequestType.DELETE:
//           response = await client.delete(uri,
//               headers: headers, body: jsonEncode(body));
//           break;
//       }

//       Map<String, dynamic>? result;
//       try {
//         result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
//       } catch (e) {}

//       jsonResponse.putIfAbsent(
//           'response',
//           () => result == null
//               ? jsonDecode({
//                   'title': Utf8Codec().decode(response.bodyBytes),
//                 }.toString())
//               // ? jsonDecode(jsonEncode({
//               //     'title': Utf8Codec().decode(response.bodyBytes),
//               //   }))
//               : jsonDecode(Utf8Codec().decode(response.bodyBytes)));
//       jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

//       return jsonResponse;
//     } catch (e) {
//       print(e);
//       TestCustomToast.showMessage(
//         message: e.toString(),
//         messageType: MessageType.WARNING,
//       );
//     }
//   }
// }


// // void test() async {
// //   var response = await client.post(Uri.https(baseUrl, 'api/web/user/login'),
//       // headers: {"Content-Type": "application/json"},
// //       body:
// //           jsonEncode({"userName": "Test@gmail.com", "password": "Test@1234"}));

// // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
// // }


// // training.owner-tech.com/api/Admin/Meal/MealGetById/?id&name&rate
