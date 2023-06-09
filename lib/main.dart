import 'package:crypto_wallet/provider/moralis_provider.dart';
import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WalletProvider>(
          create: (context) => WalletProvider(),
        ),
        Provider<MoralisProvider>(
          create: (context) => MoralisProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Crypto Wallet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage()),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Wallet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final mnemonic = walletProvider.generateMemonics();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Mnemonic Phrase'),
                      content: Text(mnemonic),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Generate Mnemonic'),
            ),
            ElevatedButton(
              onPressed: () async {
                final mnemonic = walletProvider.generateMemonics();
                final privateKey = await walletProvider.getPrivateKey(mnemonic);
                final publicKey = await walletProvider.getPublicKey(privateKey);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Wallet Info'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Mnemonic: $mnemonic'),
                          Text('Private Key: $privateKey'),
                          Text('Public Key: $publicKey'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Generate Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}
