import 'dart:convert';

import 'package:http/http.dart';

const String url = "https://dummyjson.com";

// todo : add user

// todo: login user
Future<Response> login(
    {required String username, required String password}) async {
  const String loginUrl = "https://dummyjson.com/auth/login";
  final String requestBodyJson = jsonEncode(
    {"username": username, "password": password},
  );
  print('api started calls');
  final Response response;
  try {
    response = await post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: requestBodyJson,
      encoding: Encoding.getByName("utf-8"),
    );
  } catch (e) {
    print('api faced some problems');
    return Response('Something wrong happened', 400);
  }
  print((response.statusCode));
  print(response.body);
  print('api work finished. .....');
  return response;
}

// todo: remove user







