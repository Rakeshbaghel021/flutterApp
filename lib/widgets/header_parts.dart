import 'package:dashboard/config/responsive.dart';
import 'package:dashboard/utils/theme.dart';
import 'package:flutter/material.dart';

class HeaderParts extends StatelessWidget {
  const HeaderParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                  color: MyAppColor.primary,
                ),
              ),
              Text(
                'Payments updates',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: MyAppColor.secondary,
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: Responsive.isDesktop(context) ? 1 : 3,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 40, right: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              hintText: 'Search',
              hintStyle: TextStyle(color: MyAppColor.secondary, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
