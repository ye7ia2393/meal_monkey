// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/core/enums/request_type.dart';
// import 'package:meal_monkey/testroom/test_custom_toast.dart';

// class NetworkUtil {
//   static String baseUrl = 'training.owner-tech.com';
//   static var client = http.Client();

//   static Future<dynamic> sendRequest({
//     required String seconderyUrl,
//     required RequestType requestType,
//     Map<String, String>? headers,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? params,
//   }) async {
//     try {
//       var uri = Uri.https(baseUrl, seconderyUrl, params);

//       late http.Response response;

//       int statusCode = 0;

//       String strResponse = '';
//       Map<String, dynamic>? jsonResponse = {};

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
//       statusCode = response.statusCode;
//       strResponse = Utf8Codec().decode(response.bodyBytes);

//       jsonResponse.putIfAbsent('statusCode', () => statusCode);
//       jsonResponse.putIfAbsent('response', () => jsonDecode(strResponse));

//       return jsonResponse;
//     } catch (e) {
//       print(e);
//       TestCustomToast.showMessage(
//         message: e.toString(),
//         messageType: MessageType.WARNING,
//       );
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