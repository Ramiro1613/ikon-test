import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ikon_test/classes/contact.dart';

class Navigation {
  static void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  static void goToContactDetails(
      BuildContext context, String index, Contact contact) {
    Navigator.pushNamed(context, "/contact-details",
        arguments: [index, contact]);
  }
}
