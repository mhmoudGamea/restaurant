import 'package:flutter/material.dart';

class Helper {
  static Widget buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(10),
      child: Text('$title: ',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  static Widget buildListTile(
      String label, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: CircleAvatar(
        radius: 17,
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          icon,
          size: 22,
          color: Colors.white,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.black54),
      ),
      onTap: tabHandler,
    );
  }
}
