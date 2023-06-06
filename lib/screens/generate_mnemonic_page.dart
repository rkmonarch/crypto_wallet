import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletProvider>(context);
    final mnemonic = provider.generateMemonics();
    final mnemonicWords = mnemonic.split(' ');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mnemonic"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSpaceSmall(context),
            Text(
              "Please store this mnemonic phrase safely",
              style: TextStyle(fontSize: 18),
            ),
            vSpaceSmall(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  mnemonicWords.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1} ${mnemonicWords[index]}',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
