import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class MoralisService {
  Future<String> getBalance(String address);
}

class MoralisProvider extends ChangeNotifier implements MoralisService {
  String url = "http://192.168.29.20:3000/";
  @override
  Future<String> getBalance(String address) {
    lg.wtf(url + "?chain=80001?address=$address");
    return http
        .get(Uri.parse(url + "?chain=80001&address=$address"))
        .then((value) {
      lg.wtf(value.body);
      return value.body;
    });
  }
}
