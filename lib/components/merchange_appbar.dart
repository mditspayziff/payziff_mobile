import 'package:flutter/material.dart';
import '../profile/profile.dart';
import '../screens/Transactions.dart';
import '../screens/payto_customer.dart';
import '../screens/sub_merchants_screen.dart';
import '../screens/wallet_screen.dart';

class MerchantAppBar extends StatelessWidget {
  final Widget child;
  final TabController? tabController;
  const MerchantAppBar({super.key, required this.child, this.tabController});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    return Scaffold(
        appBar: appBar(context, tabController),
        drawer: drawer(statusBarHeight + appBarHeight + 1, context),
        body: child
    );
  }

  PreferredSizeWidget appBar(
      BuildContext context, TabController? tabController) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: const Color(0xff93C3FF),
      title: const Text("PayZiff", style: TextStyle(color: Color(0xff013B84)),),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const WalletScreen();
              }));
            },
            icon: const Icon(Icons.wallet))
      ],
      bottom: tabController == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.white,
                  ),
                  TabBar(
                    isScrollable: true,
                    controller: tabController,
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(color: Colors.black),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      Tab(
                        child: Text("Transactions",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      Tab(
                        child: Text("To Wallet",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      Tab(
                          child: Text("From Wallet",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))),
                    ],
                  )
                ],
              )),
    );
  }

  Widget drawer(double padding, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: padding),
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: InkWell(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Text("Sudhakar")
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MDITSProfile(
                              name: "Venkata Chary, Padala",
                              email: "test@gmail.com",
                              phoneNumber: "0091 7013298534",
                              onClick: () {});
                        }));
                      })),
              ListTile(
                title: const Text('Transfer To Wallet'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const WalletScreen();
                  }));
                },
              ),
              ListTile(
                title: const Text('Pay To Customer'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const PayToCustomer();
                  }));
                },
              ),
              ListTile(
                title: const Text('Sub Merchants'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const SubMerchants();
                  }));
                },
              ),
              ListTile(
                title: const Text('Transactions'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Transactions();
                  }));
                },
              )
            ],
          ),
        )
    );
  }
}
