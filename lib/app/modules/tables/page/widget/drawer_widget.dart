import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SwitchListTile(
          title: const Text('Dark mode'),
          onChanged: (bool value) {
            Get.changeTheme(
              value ? ThemeData.dark() : ThemeData.light(),
            );
          },
          value: context.isDarkMode,
        ),
      ),
    );
  }
}
