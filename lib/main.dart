import 'package:flutter/material.dart';
import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // ChangeNotifierProvider<WalletProvider>(
  //   create: (context) => WalletProvider(),
  //   child: MyApp(),
  // );
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
      create: (context) => WalletProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Crypto Wallet"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final mnemonic = provider.generateMemonics();
                    final privateKey = await provider.getPrivateKey(mnemonic);
                    final pubKey = await provider.getPublicKey(privateKey);

                    print("mnemonic $mnemonic");
                    print("privatKey  $privateKey");
                    print("pubKey ${pubKey.toString()}");
                  },
                  child: Text("Generate Wallet"))
            ],
          ),
        ),
      ),
    );
  }
}
