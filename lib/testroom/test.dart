// import 'package:dartz/dartz.dart';
// import 'package:meal_monkey/core/data/models/apis/token_info_model.dart';
// import 'package:meal_monkey/core/data/models/common_response.dart';
// import 'package:meal_monkey/core/data/network/endpoints/user_endpoints.dart';
// import 'package:meal_monkey/core/data/network/network_config.dart';
// import 'package:meal_monkey/core/enums/request_type.dart';
// import 'package:meal_monkey/core/utils/network_utils.dart';
// import 'package:meal_monkey/testroom/post_model.dart';

// class PostRepository {
//   Future<Either<String, PostModel>> createPosts({
//     required String title,
//     required String body,
//     required int userId,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         requestType: RequestType.POST,
//         url: PostEndpoints.create,
//         headers: NetworkConfig.getHeaders(
//           requestType: RequestType.POST,
//           needAuth: false,
//         ),
//         body: {
//           "title": title,
//           "body": body,
//           "userId": userId,
//         },
//       ).then(
//         (response) {
//           CommonResponseModel<PostModel> commonResponse =
//               CommonResponseModel.fromJson(response);
//           if (commonResponse.getStatus) {
//             return Right(
//               commonResponse.data ?? PostModel(title: "Empety Response"),
//             );
//           } else {
//             return Left(commonResponse.message ?? '');
//           }
//         },
//       );
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, List<PostModel>>> getAllPost() async {
//     try {
//       return NetworkUtil.sendRequest(
//         requestType: RequestType.GET,
//         url: PostEndpoints.getAll,
//         headers: NetworkConfig.getHeaders(
//           requestType: RequestType.GET,
//           needAuth: false,
//         ),
//       ).then(
//         (response) {
//           CommonResponseModel<List<dynamic>> commonResponse =
//               CommonResponseModel.fromJson(response);
//           if (commonResponse.getStatus) {
//             List<PostModel> resultList = [];

//             commonResponse.data!.forEach((element) {
//               PostModel.fromJson(element);
//             });

//             return Right(resultList);
//           } else {
//             return Left(commonResponse.message ?? '');
//           }
//         },
//       );
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, PostModel>> updatePost({
//     required String title,
//     required String body,
//     required int userId,
//     required int postId,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         requestType: RequestType.PUT,
//         url: PostEndpoints.update + '/$postId',
//         headers: NetworkConfig.getHeaders(
//           requestType: RequestType.PUT,
//           needAuth: false,
//         ),
//         body: {
//           "title": title,
//           "body": body,
//           "userId": userId,
//           "id": postId,
//         },
//       ).then(
//         (response) {
//           CommonResponseModel<PostModel> commonResponse =
//               CommonResponseModel.fromJson(response);
//           if (commonResponse.getStatus) {
//             return Right(
//               commonResponse.data ?? PostModel(title: "Empety Response"),
//             );
//           } else {
//             return Left(commonResponse.message ?? '');
//           }
//         },
//       );
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
//   Future<Either<String, PostModel>> deletePost({
//     required int postId,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         requestType: RequestType.DELETE,
//         url: PostEndpoints.delete + '/$postId',
//         headers: NetworkConfig.getHeaders(
//           requestType: RequestType.DELETE,
//           needAuth: false,
//         ),
    
//       ).then(
//         (response) {
//           CommonResponseModel<dynamic> commonResponse =
//               CommonResponseModel.fromJson(response);
//           if (commonResponse.getStatus) {
            
//             return Right(
//               commonResponse.data ?? PostModel(title: "Empety Response"),
//             );
//           } else {
//             return Left(commonResponse.message ?? '');
//           }
//         },
//       );
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
