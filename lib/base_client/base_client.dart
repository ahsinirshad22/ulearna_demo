import 'dart:io';

import 'package:http/http.dart' as http;

import '../controller/common_controller.dart';
import '../utils/export.dart';

// Map<String, String> translations = {
// //Base Client
// "failedToConnect": "Failed to connect to server",
// "noInternet": "No Internet Connection",
// "timeOutError":
// "Connection Time Out. Kindly check your internet connection",
// "tokenExpired": "Token Expired: Please login again",
// "badRequest": "Bad Request",
// "accessDenied": "Access Denied: Please login again",
// "methodNotAllowed": "Request method is not allowed",
// "serverError": "Server Error",
// "somethingWentWrong": "Something went wrong",
// "dataParseError": "Error occurred while parsing data",
// //Helper Functions
// "dismiss":"Dismiss",
// "failedToLaunch": "Failed to launch url",
// };

class BaseClient {
  Future<bool> checkInternet() async {
    try {
      var response = await http
          .get(Uri.parse("https://google.com"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      }).timeout(const Duration(seconds: timeOutDuration));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    }
  }

  noInternet() async {
    var res = await checkInternet();
    if (res) {
      showToast("failedToConnect".tr);
    } else {
      showToast("noInternet".tr);
    }
  }

  connectionTimeOut() {
    showToast("timeOutError".tr);
  }

  methodNotAllowedError() {
    showToast("methodNotAllowed".tr);
  }

  serverError() {
    showToast("serverError".tr);
  }

  unAuthenticatedError() {
    makeUserLogOut();
    showToast("tokenExpired".tr);
  }

  badRequestError() {
    showToast("badRequest".tr);
  }

  accessDeniedError() {
    makeUserLogOut();
    showToast("accessDenied".tr);
  }

  unknownError() {
    showToast("somethingWentWrong".tr);
  }

  makeUserLogOut() {
  }

  void parseErrorOccurred(String error) {
    customLog(error);
    showToast("dataParseError".tr);
  }

  static const int timeOutDuration = 20;

  Future<Map<String, String>> getHeaders(
      bool isAuthenticated, Map<String, String> extraHeaders,
      {bool isMultiPart = false}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    if (!isMultiPart) {
      headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      });
    }

    if (extraHeaders.isNotEmpty) {
      headers.addAll(extraHeaders);
    }

    if (isAuthenticated) {
      // Get Token add Here

      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final String token = prefs.getString('token') ?? '';
      //
      // headers.addAll({
      //   'Authorization': 'Bearer $token',
      // });
    }

    return headers;
  }

  // GET
  Future<dynamic> get(String url,
      {bool isAuthenticated = true,
      bool showSuccessToast = false,
      Map<String, String>? extraHeaders}) async {
    var uri = Uri.parse(url);
    customLog("Url: $url");
    customLog("Request Type: GET");

    Map<String, String> headers =
        await getHeaders(isAuthenticated, extraHeaders ?? {});

    try {
      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: timeOutDuration));
      customLog("Response StatusCode: ${response.statusCode}");
      // customLog("Response Body: ${response.body}");
      return _processResponse(response, url, "", showSuccessToast);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  // POST
  Future<dynamic> post(String url, Map<String, dynamic> body,
      {bool isAuthenticated = true,
      bool showSuccessToast = false,
      Map<String, String>? extraHeaders}) async {
    var uri = Uri.parse(url);
    try {
      customLog("Url: $url");
      customLog("Request Type: POST");
      customLog("Request Body: ${jsonEncode(body)}");

      Map<String, String> headers =
          await getHeaders(isAuthenticated, extraHeaders ?? {});

      var response = await http
          .post(
            uri,
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: timeOutDuration));
      customLog("Response StatusCode: ${response.statusCode}");
      // customLog("Response Body: ${response.body}");
      return _processResponse(
          response, url, jsonEncode(body), showSuccessToast);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  Future<dynamic> put(String url, Map<String, dynamic> body,
      {bool isAuthenticated = true,
      bool showSuccessToast = false,
      Map<String, String>? extraHeaders}) async {
    var uri = Uri.parse(url);
    try {
      customLog("Url: $url");
      customLog("Request Type: PUT");
      customLog("Request Body: ${jsonEncode(body)}");

      Map<String, String> headers =
          await getHeaders(isAuthenticated, extraHeaders ?? {});

      var response = await http
          .put(
            uri,
            body: jsonEncode(body),
            headers: headers,
          )
          .timeout(const Duration(seconds: timeOutDuration));
      customLog("Response StatusCode: ${response.statusCode}");
      // customLog("Response Body: ${response.body}");
      return _processResponse(
          response, url, jsonEncode(body), showSuccessToast);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  Future<dynamic> multiPartPost({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, File> files,
    bool isAuthenticated = true,
    bool showSuccessToast = false,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    customLog("Url: $url");
    customLog("Request Type: POST MUlTI_PART");
    customLog("Request Body: ${jsonEncode(body)}");

    Map<String, String> extraHeaders = {
      "Content-Type": "multipart/form-data;",
    };

    // You can add your own content type header
    Map<String, String> headers =
        await getHeaders(isAuthenticated, extraHeaders, isMultiPart: true);
    // Add all headers
    headers.forEach((key, value) {
      request.headers[key] = value;
    });

    // Add fields from the body
    body.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Add files to the request
    files.forEach((key, file) async {
      request.files.add(
        await http.MultipartFile.fromPath(
          key,
          file.path,
        ),
      );
    });

    try {
      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      return _processResponse(
          response, url, jsonEncode(body), showSuccessToast);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  Future<dynamic> multiPartPut({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, File> files,
    bool isAuthenticated = true,
    bool showSuccessToast = false,
  }) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(url),
    );

    customLog("Url: $url");
    customLog("Request Type: POST MUlTI_PART");
    customLog("Request Body: ${jsonEncode(body)}");

    Map<String, String> extraHeaders = {
      "Content-Type": "multipart/form-data;",
    };

    // You can add your own content type header
    Map<String, String> headers =
        await getHeaders(isAuthenticated, extraHeaders, isMultiPart: true);
    // Add all headers
    headers.forEach((key, value) {
      request.headers[key] = value;
    });

    // Add fields from the body
    body.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Add files to the request
    files.forEach((key, file) async {
      request.files.add(
        await http.MultipartFile.fromPath(
          key,
          file.path,
        ),
      );
    });

    try {
      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      return _processResponse(
          response, url, jsonEncode(body), showSuccessToast);
    } on SocketException {
      noInternet();
    } on TimeoutException {
      connectionTimeOut();
    }
  }

  dynamic _processResponse(http.Response response, String url, String params,
      bool showSuccessToast) {
    switch (response.statusCode) {
      case 200:
        return processRes(
            response: response, showSuccessToast: showSuccessToast);
      case 201:
        return processRes(
            response: response, showSuccessToast: showSuccessToast);
      case 400:
        badRequestError();
        return null;
      case 401:
        // Un Authorized
        unAuthenticatedError();
        return null;
      case 403:
        // Access Denied
        accessDeniedError();
        return null;
      case 405:
        // Method Not Allowed
        methodNotAllowedError();
        return null;
      case 504:
        accessDeniedError();
        return null;
      case 500:
        // Server Error
        serverError();
        return null;
      default:
        // Unknown Error
        unknownError();
        return null;
    }
  }

  processRes(
      {String? title,
      required http.Response response,
      bool showSuccessToast = false,bool hideErrors = false}) {
    try {
      var body = utf8.decode(response.bodyBytes);
      var data = jsonDecode(body);
      if (data['statusCode'].runtimeType == int) {
        if ((data['statusCode'] != 200)) {
          var message = data['message'];
          if (!hideErrors) {
            showToast(message ?? "something_went_wrong".tr);
          }
          return null;
        } else {
          if (showSuccessToast) {
            var message = data['message'];
            showToast(message ?? "",);
          }
          return body;
        }
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      parseErrorOccurred(e.toString());
    }
    return null;
  }
}
