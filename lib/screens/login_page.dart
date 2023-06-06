import 'package:bip39/bip39.dart';
import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/generate_mnemonic_page.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crypto Wallet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              width: deviceWidth(context) / 1.5,
              ontap: () async {
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
              ontap: () async {},
              text: "Import from SEED",
            ),
          ],
        ),
      ),
    );
  }
}
