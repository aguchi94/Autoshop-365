import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/models/person.dart';

class PersonProvider extends ChangeNotifier {
  List<Users> users = [];

  addPerson(Users user) {
    users.add(user);
  }

  addPersons(List<Users> user) {
    users = user;
  }
}
