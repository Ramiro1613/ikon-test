import 'dart:convert';

import 'package:ikon_test/classes/contact.dart';

class GroupContacts {
  String groupName;
  List<Contact> contacts;
  GroupContacts(this.groupName, this.contacts);
  GroupContacts.fromJson(Map<String, dynamic> json)
      : groupName = json['groupName'],
        contacts = json['contacts'] != null
            ? new List<Contact>.from(json['contacts']
                .map((dynamic item) => Contact.fromData(item))
                .toList())
            : [];

  Map<String, dynamic> toJson() {
    return {
      'groupName': this.groupName,
      'contacts': jsonDecode(jsonEncode(this.contacts))
    };
  }
}
