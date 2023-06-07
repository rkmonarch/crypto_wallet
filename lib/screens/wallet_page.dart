import 'package:crypto_wallet/provider/wallet_provider.dart';
import 'package:crypto_wallet/resources/ui_helpers.dart';
import 'package:crypto_wallet/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';
  String balance = '';
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
    }
  }

  @override
  void initState() {
    loadWalletData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Wallet Page"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            vSpaceMassive(context),
            Center(
              child: Text(
                "Wallet Address",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            vSpaceSmall(context),
            Center(
                child: Text(
              walletAddress,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            )),
            vSpaceMedium(context),
            Center(
              child: Text(
                "Balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            vSpaceSmall(context),
            Center(
                child: Text(
              "0",
              style: TextStyle(fontSize: 17),
            )),
            SizedBox(
              height: deviceHeight(context) * 0.1,
            ),
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
                        TabBar(labelColor: Colors.black, tabs: [
                          Text("Assets"),
                          Text("NFTs"),
                          Text("Options")
                        ]),
                        Expanded(
                            child: TabBarView(
                          children: [
                            Text("data"),
                            Text("data333"),
                            Center(
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text("Logout"),
                                onTap: () async {
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  await preferences.remove("privateKey");
                                  //push to login page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => LoginPage()));
                                },
                              ),
                            )
                          ],
                        ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
