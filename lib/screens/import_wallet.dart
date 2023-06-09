import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/screens/wallet_page.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/ui_helpers.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({super.key});

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  bool _isVerified = false;
  TextEditingController _mnemonicController = new TextEditingController();

  void navigateWalletPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => WalletPage()));
  }

  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    final privateKey = walletProvider.getPrivateKey(_mnemonicController.text);
    navigateWalletPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Mnemonic"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vSpaceMedium(context),
            Text(
              "Please verify Mnemonic phrase",
              style: TextStyle(fontSize: 18),
            ),
            vSpaceSmall(context),
            TextField(
              controller: _mnemonicController,
              decoration:
                  InputDecoration(labelText: "Please enter mnemonic phrase"),
            ),
            vSpaceMedium(context),
            Center(
              child: Button(
                width: deviceWidth(context) / 1.5,
                ontap: () {
                  verifyMnemonic();
                },
                text: "Import Wallet",
              ),
            ),
            vSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
