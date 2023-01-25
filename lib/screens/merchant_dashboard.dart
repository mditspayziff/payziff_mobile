import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled/managers/login_manager.dart';
import 'package:untitled/profile/profile.dart';
import 'package:untitled/screens/payto_customer.dart';
import 'package:untitled/screens/transfer_wallet_screen.dart';
import 'package:untitled/screens/wallet_screen.dart';

import '../components/merchange_appbar.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class MerchantDashboard extends StatelessWidget {
  List<String> cards = [
    "Sub Merchants",
    "Commissions",
    "Successfully Transactions",
    "Failure Transactions"
  ];
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  final List<ChartData> chartData = [
    ChartData('David', 25, Colors.red),
    ChartData('Steve', 38, Colors.blue),
    ChartData('Jack', 34, Colors.yellow),
    ChartData('Others', 52, Colors.green)
  ];

  MerchantDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(child: _mainContainer(context));
  }

  Widget _mainContainer(BuildContext context) {
    LoginManager loginManager = Provider.of<LoginManager>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white24,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Wrap(
            children: cards.map<Widget>((item) => Card(child: SizedBox(height: 100, width: screenWidth * 0.44, child: Text("data")),)).toList()
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: SfCircularChart(series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ]))
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color? color;
}
