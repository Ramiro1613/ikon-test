import 'dart:core';
import 'package:flutter/material.dart';
import 'package:ikon_test/classes/contact.dart';
import 'package:ikon_test/classes/groups.dart';
import 'package:ikon_test/data/contacts-test-data.dart' as ts;
import 'package:ikon_test/navigation.dart';
import 'package:ikon_test/utils.dart' as u;

class GroupView extends StatefulWidget {
  GroupView({Key key}) : super(key: key);

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  var top = 0.0;
  List<Contact> contactList;
  List<GroupContacts> groupContacts;
  @override
  void initState() {
    super.initState();
    var x = ts.contactsTestData;
    x.sort();
    contactList = new List<Contact>.from(
        x.map((dynamic item) => Contact.fromData(item)).toList());
    groupContacts = u.getGroups(ts.contactsTestData);
  }

  static String _displayStringForOption(Contact option) => option.name;

  inputAutocomplete() {
    return Autocomplete<Contact>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Contact>.empty();
        }
        return contactList.where((Contact option) {
          var y = option.name.toString().toLowerCase();
          var x = option.name
              .toString()
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
          return x;
        });
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.sort_by_alpha),
              onPressed: () {
                setState(() {
                  groupContacts =
                      new List<GroupContacts>.from(groupContacts.reversed);
                });
              },
            ),
            border: InputBorder.none,
          ),
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
      onSelected: (Contact selection) {
        Navigation.goToContactDetails(
            context, '${contactList.indexOf(selection)}', selection);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            toolbarHeight: 80.0,
            backgroundColor: Colors.white,
            elevation: 0,
            collapsedHeight: 80,
            expandedHeight: 140.0,
            floating: false,
            pinned: true,
            leading: Text(''),
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                title: top > 140
                    ? Text('')
                    : Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                        child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: inputAutocomplete(),
                                      height: 35,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                    )))),
                          ],
                        )),
                centerTitle: true,
                background: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Color(0xFFFFFFFF)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Contactos',
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: inputAutocomplete(),
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        )
                      ],
                    )),
              );
            })),
        SliverLayoutBuilder(builder: (BuildContext context, constraints) {
          return SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              GroupContacts e = groupContacts[index];
              return Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      color: Theme.of(context).primaryColor,
                      width: double.infinity,
                      height: 25,
                      child: Text(e.groupName,
                          style: Theme.of(context).textTheme.headline3)),
                  Container(
                    child: Column(
                      children: e.contacts.map((e) {
                        return Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () => Navigation.goToContactDetails(
                                context, '$index${e.name}', e),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Hero(
                                        tag: '$index${e.name}',
                                        child: CircleAvatar(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: u.iniciales(context, e.name),
                                          ),
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          radius: 30,
                                        ),
                                      )),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Text(e.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    alignment: Alignment.centerLeft,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }, childCount: groupContacts.length),
          );
        })
      ],
    ));
  }
}
