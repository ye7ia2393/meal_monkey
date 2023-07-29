
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:meal_monkey/core/enums/request_type.dart';

// class NetworkUtil {
//   static String baseUrl = 'training.owner-tech.com';
//   static var client = http.Client();

//   static Future<dynamic> sendRequest({
//     required RequestType type,
//     required String url,
//     Map<String, String>? headers,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? params,
//   }) async {
//     try {
//       //!--- Required for request ----
//       //*--- Make full api url ------
//       var uri = Uri.https(baseUrl, url, params);

//       //?--- To Save api response ----
//       late http.Response response;
//       //?--- To Save api status code ----
//       int statusCode = 0;

//       //!--- Required convert api response to Map ----
//       String strResponse = '';
//       Map<String, dynamic> jsonResponse = {};

//       //*--- Make call correct request type ------
//       switch (type) {
//         case RequestType.GET:
//           response = await client.get(uri, headers: headers);
//           break;
//         case RequestType.POST:
//           response =
//               await client.post(uri, body: jsonEncode(body), headers: headers);
//           break;
//         case RequestType.PUT:
//           response =
//               await client.put(uri, body: jsonEncode(body), headers: headers);
//           break;
//         case RequestType.DELETE:
//           response = await client.delete(uri,
//               body: jsonEncode(body), headers: headers);
//           break;
//       }

//       statusCode = response.statusCode;
//       strResponse = Utf8Codec().decode(response.bodyBytes);

//       jsonResponse.putIfAbsent('respons', () => jsonDecode(strResponse));
//       jsonResponse.putIfAbsent('statusCode', () => statusCode);

//       return jsonResponse;
//     } catch (e) {
//       print(e);
//     }
//   }

//   // void test() async {
//   //   var response = await client.post(Uri.https(baseUrl, 'api/web/user/login'),
//   //       headers: {"Content-Type": "application/json"},
//   //       body: jsonEncode(
//   //           {"userName": "Test@gmail.com", "password": "Test@1234"}));

//   //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//   // }
// }