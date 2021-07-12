class Contact {
  Contact(this.name);
  String name;
  Contact.fromData(String value) : name = value != null ? value : '';
}
