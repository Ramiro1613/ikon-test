import 'package:flutter/material.dart';
import 'package:ikon_test/classes/contact.dart';
import 'package:ikon_test/utils.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen(this.index, this.contact, {Key key})
      : super(key: key);
  final String index;
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Detalles del Contacto'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: index,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: iniciales(context, contact.name),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(120)),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          contact.name,
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ))),
            Expanded(flex: 6, child: Container()),
          ],
        ),
      ),
    );
  }
}
