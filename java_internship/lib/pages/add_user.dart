import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  AddUserPage({super.key, required this.accessToken});
  String accessToken;
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController firstNameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();
  TextEditingController streetCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();

  void addNewUser() async {
    String uri =
        "https://qa.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=create";
    var response = await http.post(
      Uri.parse(uri),
      headers: {'Authorization': 'Bearer ${widget.accessToken}'},
      body: jsonEncode({
        "first_name": "Jane",
        "last_name": "Doe",
        "street": "Elvnu Street",
        "address": "H no 2 ",
        "city": "Delhi",
        "state": "Delhi",
        "email": "sam@gmail.com",
        "phone": "12345678"
      }
      ),
    );
    if(response.statusCode==200){
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: const Color.fromRGBO(245, 182, 179, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 100),
                width: 200,
                child: TextField(
                  controller: firstNameCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'first name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: lastNameCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'last name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: streetCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'street',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: addressCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'address',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: cityCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'city',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: stateCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'state',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: emailCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 200,
                child: TextField(
                  controller: phoneCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'phone',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  addNewUser();
                },
                child: const Text(
                  "Add User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
