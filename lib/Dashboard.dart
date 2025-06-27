import 'package:dashboard/model/model.dart';
import 'package:dashboard/config/responsive.dart';
import 'package:dashboard/config/size_config.dart';
import 'package:dashboard/widgets/bar_chart.dart';
import 'package:dashboard/widgets/header_parts.dart';
import 'package:dashboard/widgets/side_drawer_menu.dart';
import 'package:dashboard/widgets/transfer_infocard.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/utils/theme.dart';

class MyDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  MyDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      key: drawerKey,
      drawer: const SizedBox(width: 100, child: SideDrawerMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.black),
              ),
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(flex: 1, child: SideDrawerMenu()),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderParts(),
                      SizedBox(height: SizeConfig.blockSizeVertical * 4),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: infoCardData.map((info) {
                            return TransferInfoCard(infoCardModel: info);
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeHorizontal * 4),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Balance',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: MyAppColor.secondary,
                                  height: 1.3,
                                ),
                              ),
                              Text(
                                '\$1500',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: MyAppColor.primary,
                                  fontWeight: FontWeight.w900,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Past 30 DAYS',
                            style: TextStyle(
                              fontSize: 16,
                              color: MyAppColor.secondary,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 3),
                      SizedBox(height: 180, child: BarChartRepresentation()),
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "History",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: MyAppColor.primary,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            "Transaction of last 6 months",
                            style: TextStyle(
                              fontSize: 16,
                              color: MyAppColor.primary,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 3),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
