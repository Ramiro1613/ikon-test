import 'package:flutter/material.dart';
import 'package:ikon_test/classes/groups.dart';

String getInitials(String name) {
  var x = name.split(' ');
  var y = x[0].substring(0, 1);
  var w = x[1] != null ? x[1].substring(0, 1) : '';
  return '$y$w'.toUpperCase();
}

FittedBox iniciales(BuildContext context, String name) {
  return FittedBox(
    fit: BoxFit.fitHeight,
    child: Text(
      getInitials(name),
      style: Theme.of(context).textTheme.headline2,
    ),
  );
}

List<GroupContacts> getGroups(List<String> rawData) {
  var groups = [];
  List<GroupContacts> returnData = [];
  rawData.forEach((e) {
    var g = e[0].toLowerCase();
    if (groups.indexOf(g) == -1) {
      groups.add(g);
      returnData.add(GroupContacts.fromJson({
        'groupName': g.toUpperCase(),
        'contacts': rawData.where((element) => element[0].toLowerCase() == g)
      }));
    }
  });
  return returnData;
}

const MaterialColor ikonGreen = const MaterialColor(
  0xFF25b14b,
  const <int, Color>{
    50: const Color(0xFF25b14b),
    100: const Color(0xFF25b14b),
    200: const Color(0xFF25b14b),
    300: const Color(0xFF25b14b),
    400: const Color(0xFF25b14b),
    500: const Color(0xFF25b14b),
    600: const Color(0xFF25b14b),
    700: const Color(0xFF25b14b),
    800: const Color(0xFF25b14b),
    900: const Color(0xFF25b14b),
  },
);
