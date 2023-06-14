import 'dart:convert';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class PaperProvider {
  Future<String> sendNFT(
      {required String chain,
      required String collectionName,
      required String collectionDescription,
      required List nfts});
}

class PaperService extends ChangeNotifier implements PaperProvider {
  String url = "https://withpaper.com/api/2022-08-12/minting-toolkit/mint";
  @override
  Future<String> sendNFT(
      {required String chain,
      required String collectionName,
      required String collectionDescription,
      required List nfts}) async {
    final data = jsonEncode({
      {
        "chain": chain,
        "collectionName": collectionName,
        "collectionDescription": collectionDescription,
        "nfts": nfts
      }
    });
    final response = await http.post(Uri.parse(url), body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer c068b34d-cc3e-42fa-8740-90735330cac7"
    });

    if (response.statusCode == 200) {
      lg.wtf(response.body);
      return response.body;
    } else {
      lg.wtf(response.body);
      throw UnimplementedError();
    }
  }
}
