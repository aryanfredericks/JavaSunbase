import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:java_internship/pages/add_user.dart';
import 'package:java_internship/pages/edit_user_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.accessToken});
  String accessToken;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    fetchCustomerList();
  }

  final uri =
      "https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=get_customer_list";
  List<dynamic> arr = [];
  Future<void> fetchCustomerList() async {
    final response = await http.get(
      Uri.parse(uri),
      headers: {
        'Authorization': 'Bearer ${widget.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        arr = jsonDecode(response.body) as List<dynamic>;
      });
    }
  }

  void deleteUser(String uuid)async{
    String uri = "https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=delete&uuid=$uuid";
    var response = await http.post(
      Uri.parse(uri),
      headers: {
        'Authorization' :'Bearer ${widget.accessToken}'
      },
    );
    if(response.statusCode==200){
      fetchCustomerList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User DashBoard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: RefreshIndicator(
        onRefresh: fetchCustomerList,
        child: ListView.builder(
          itemCount: arr.length,
          itemBuilder: (context, index) {
            final item = arr[index];
            return InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(201, 66, 58, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${item['first_name']} ${item['last_name']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'email: ${item['email']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditUser(
                                    item: item,
                                    accessToken: widget.accessToken,
                                  ),
                                ));
                            fetchCustomerList();
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                          splashColor: Colors.black54,
                        ),
                        IconButton(
                          onPressed: () {
                            deleteUser(item['uuid']);
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                          splashColor: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserPage(
                accessToken: widget.accessToken,
              ),
            ),
          );
          fetchCustomerList();
        },
        child: Icon(
          Icons.person_add_alt_1_rounded,
        ),
        backgroundColor: Colors.purpleAccent,
        splashColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}
