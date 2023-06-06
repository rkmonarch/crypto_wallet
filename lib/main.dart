import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/login_page.dart';
import 'package:crypto_wallet/widgets/button.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
