import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/generate_mnemonic_page.dart';
import 'package:crypto_wallet/screens/import_wallet.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImportWallet()));
              },
              text: "Import from SEED",
            ),
          ],
        ),
      ),
    );
  }
}
