import 'dart:convert';

import 'package:crypto_wallet/provider/moralis_provider.dart';
import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';
  String? balance;
  String pvKey = '';

  Future<void> loadWalletData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? privateKey = preferences.getString("privateKey");
    if (privateKey != null) {
      final provider = WalletProvider();
      await provider.loadPrivateKey();
      EthereumAddress address = await provider.getPublicKey(privateKey);
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });
      lg.wtf(walletAddress);
    }
  }

  void getBalance() async {
    final provider = MoralisProvider();
    final _balance = await provider.getBalance(walletAddress);
    var data = jsonDecode(_balance);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      balance = (int.parse(data['balance']) / 1000000000000000000).toString();
      preferences.setString('balance', balance!);
    });
  }

  void copyAddress() {
    Clipboard.setData(ClipboardData(text: walletAddress));
    final snackBar = SnackBar(content: Text('Copied to Clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    loadWalletData().then((value) => getBalance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Wallet"),
      ),
      body: balance != null
          ? Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  vSpaceMassive(context),

                  Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Wallet Address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            hSpaceMedium(context),
                            IconButton(
                                onPressed: () {
                                  copyAddress();
                                },
                                icon: Icon(Icons.copy))
                          ],
                        ),
                      ),
                      vSpaceSmall(context),
                      Text(
                        walletAddress,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                        softWrap: false,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      vSpaceMedium(context),
                      Center(
                        child: Text(
                          "Balance",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      vSpaceSmall(context),
                      Center(
                          child: Text(
                        balance ?? "",
                        style: TextStyle(fontSize: 17),
                      )),
                      SizedBox(
                        height: deviceHeight(context) * 0.1,
                      ),
                    ],
                  ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.send),
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.refresh),
                      )
                    ],
                  ),
                  vSpaceSmall(context),
                  vSpaceSmall(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Send"), Text("Refresh")],
                  ),
                  vSpaceMedium(context),
                  vSpaceMedium(context),
                  Expanded(
                      child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                  labelPadding: EdgeInsets.symmetric(
                                      vertical: deviceHeight(context) * 0.01,
                                      horizontal: deviceWidth(context) * 0.05),
                                  labelColor: Colors.black,
                                  tabs: [
                                    Text("Assets"),
                                    Text("NFTs"),
                                    Text("Options")
                                  ]),
                              Expanded(
                                  child: TabBarView(
                                children: [
                                  ListView(children: <Widget>[
                                    vSpaceSmall(context),
                                    Card(
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/polygon.png",
                                          height: 40,
                                        ),
                                        title: Text(
                                            balance != null ? balance! : ""),
                                      ),
                                    ),
                                  ]),
                                  Text("data333"),
                                  Center(
                                    child: ListTile(
                                      leading: Icon(Icons.logout),
                                      title: Text("Logout"),
                                      onTap: () async {
                                        SharedPreferences preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        await preferences.remove("privateKey");
                                        //push to login page
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    LoginPage()));
                                      },
                                    ),
                                  )
                                ],
                              ))
                            ],
                          )))
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
