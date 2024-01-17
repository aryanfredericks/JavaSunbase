import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  EditUser({super.key, required this.item, required this.accessToken});
  Map item;
  String accessToken;
  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameCon =
        TextEditingController(text: widget.item['first_name'] ?? 'default');
    lastNameCon =
        TextEditingController(text: widget.item['last_name'] ?? 'default');
    streetCon = TextEditingController(text: widget.item['street'] ?? 'default');
    addressCon =
        TextEditingController(text: widget.item['address'] ?? 'default');
    cityCon = TextEditingController(text: widget.item['city'] ?? 'default');
    stateCon = TextEditingController(text: widget.item['state'] ?? 'default');
    emailCon = TextEditingController(text: widget.item['email'] ?? 'default');
    phoneCon = TextEditingController(text: widget.item['phone'] ?? 'default');
  }

  late TextEditingController firstNameCon;
  late TextEditingController lastNameCon;
  late TextEditingController streetCon;
  late TextEditingController addressCon;
  late TextEditingController cityCon;
  late TextEditingController stateCon;
  late TextEditingController emailCon;
  late TextEditingController phoneCon;

  Future<void> updateUser(String fn,String ln,String street,String add,String c,String s,String e,String p)async{
    String uri =
        "https://qa.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=update&uuid=${widget.item['uuid']}";
    var response =await http.post(
      Uri.parse(uri),
      headers: {
        'Authorization': 'Bearer ${widget.accessToken}',
      },
      body: jsonEncode({
        "first_name": fn,
        "last_name": ln,
        "street": street,
        "address": add,
        "city": c,
        "state": s,
        "email": e,
        "phone": p
      }),
    );
    if(response.statusCode==200){
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User DashBoard'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10,top: 100),
                width: 200,
                child: TextField(
                  controller: firstNameCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'first name',
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
                    hintText: 'last name ',
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
                onPressed: (){
                  updateUser(firstNameCon.text,lastNameCon.text, streetCon.text, addressCon.text, cityCon.text, stateCon.text, emailCon.text, phoneCon.text);
                },
                child: const Text(
                  "Confirm",
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
