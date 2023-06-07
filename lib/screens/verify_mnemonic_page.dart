import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/wallet_page.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;
  const VerifyMnemonicPage({super.key, required this.mnemonic});

  @override
  State<VerifyMnemonicPage> createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  TextEditingController _mnemonicController = new TextEditingController();
  bool _isVerified = false;
  void verifyMnemonic() {
    final provider = Provider.of<WalletProvider>(context, listen: false);
    if (_mnemonicController.text.trim() == widget.mnemonic.trim()) {
      provider.getPrivateKey(widget.mnemonic).then((value) {
        setState(() {
          _isVerified = true;
        });
        lg.wtf(_isVerified);
      });
    }
  }

  void navigateWalletPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => WalletPage()));
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
                text: "Verify",
              ),
            ),
            vSpaceMedium(context),
            Center(
              child: Button(
                color: !_isVerified ? Colors.grey.shade300 : Color(0xff110152),
                width: deviceWidth(context) / 1.5,
                ontap: () {
                  _isVerified ? navigateWalletPage() : null;
                },
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
