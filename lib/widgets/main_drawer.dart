import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Cooking Up...",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink),
            ),
          ),
          const Divider(),
          Helper.buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Helper.buildListTile('Filters', Icons.settings, () {
            //pushReplacementNamed much better than pushNamed because it push a page and pop the previous one from the stack.
            //but pushNamed fill the stack with too many pages only.
            Navigator.of(context).pushReplacementNamed(FiltersScreen.rn);
          }),
        ],
      ),
    );
  }
}
