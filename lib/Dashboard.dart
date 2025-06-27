import 'package:dashboard/config/responsive.dart';
import 'package:dashboard/config/size_config.dart';
import 'package:dashboard/widgets/side_drawer_menu.dart';
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
              const Expanded(child: SafeArea(child: SingleChildScrollView())),
            Expanded(flex: 1, child: Container(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
