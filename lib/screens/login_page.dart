import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/generate_mnemonic_page.dart';
import 'package:crypto_wallet/screens/import_wallet.dart';
import 'package:crypto_wallet/screens/wallet_page.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? balance;
  Future<void> getBalance() async {
    SharedPreferences preferences =
        await SharedPreferences.getInstance() as SharedPreferences;
    setState(() {
      balance = preferences.getString('balance');
    });
  }

  @override
  void initState() {
    getBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return balance == null
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text("Crypto Wallet"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    width: deviceWidth(context) / 1.5,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenerateMnemonicPage()));
                    },
                    text: "Generate Wallet",
                  ),
                  vSpaceMedium(context),
                  Button(
                    width: deviceWidth(context) / 1.5,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportWallet()));
                    },
                    text: "Import from SEED",
                  ),
                ],
              ),
            ),
          )
        : WalletPage();
  }
}
