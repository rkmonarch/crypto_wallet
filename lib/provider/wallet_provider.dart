import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';

abstract class WalletAddressService {
  String generateMemonics();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicKey(String privateKey);
}

class WalletProvider extends ChangeNotifier implements WalletAddressService {
  String? privateKey;

  //function to load private key from shared preferences
  Future<void> loadPrivateKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    privateKey = preferences.getString("privateKey");
  }

//function to write the private key in the shared preferences

  Future<void> setPrivateKey(String privateKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('privateKey', privateKey);
    notifyListeners();
  }

  @override
  String generateMemonics() {
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final privatKey = EthPrivateKey.fromHex(privateKey);
    final address = await privatKey.address;
    return address;
  }
}
