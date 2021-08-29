import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';

abstract class DioHelper {
  Future<Response> postData({
    required String url,
     dynamic data,
    String token,
  });

  Future <Response> getData({required String url, dynamic query, String token});

  Future<Response> putData({required String url, Map<String,dynamic> data, String token});
  Future<Response> deleteData(
      {required String url, dynamic query, String token});
}

class DioImplementation extends DioHelper {
   Dio dio = Dio(
    BaseOptions(
      // contentType: 'application/json',
      // responseType: ResponseType.json,
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,

        // headers: {HttpHeaders.acceptEncodingHeader: "*", HttpHeaders.connectionHeader: 'keep-alive'}
    ),
       // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =(HttpClient c){};
           // (HttpClient client) {
       //   cli/proxy all request to localhost:8888
       //     rent.findProxy = (uri) {
       //       /eturn 'PROXY localhost:8888';
       //   };
       //   client.badCertificateCallback =
       //       (X509Certificate cert, String host, int port) => true;
       // };

   );

  @override
  Future<Response> postData({ required String url, dynamic data, dynamic token}) async {

    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': appLangDirection ??'en',
      'Authorization': token?? null,

    };
    // return await request(() async {
    return await dio.post(url, data: data ?? null);
    // }
    // );
  }

  @override
  Future<Response> getData({
    required String url,
     dynamic query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': appLangDirection ??'en',
      //if not define token  ==
      // ''null request
      'Authorization':token??null
    };
    // return await (()async =>
    return await dio.get(url, queryParameters: query );
    // );
  }

  @override
  Future<Response> deleteData({required String url, dynamic query, dynamic token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': appLangDirection ??'en',
      'Authorization':token ?? null
    };
    // return await request(
    //         ()async =>
    return await dio.delete(
      url,
      queryParameters: query,
    );
    // );
  }

  @override
  Future<Response> putData({required String url, dynamic data, dynamic token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': appLangDirection ??'en',
      'Authorization': token?? null
      
    };
    // 'pKobRC5F4sQhSeIPxgRnsDVmJVXLWuCNLSrj2pTyt1MnwczCRJRGLQbG7gJFcEK3LqWAqz'
    // return await request(
    //         ()async =>
    return await dio.put(url, data: data ?? null);
    // );
  }
}

// extension on DioHelper {
//   Future request(Future<Response> request()) async {
//     try {
//       final r = await request.call();
//       return r.data;

//     } on DioError catch (e) {
//       throw ServerException(e.response.data);
//     } catch (e) {
//       throw Exception();
//     }
//   }
// }
