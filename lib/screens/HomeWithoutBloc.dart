import 'dart:convert';

import 'package:api_action_item/models/PostRequest.dart';
import 'package:api_action_item/models/User.dart';
import 'package:api_action_item/networking/APIProvider.dart';
import 'package:api_action_item/networking/Response.dart';
import 'package:api_action_item/networking/ReturnType.dart';
import 'package:api_action_item/networking/URLS.dart';
import 'package:api_action_item/shared/AppConstants.dart';
import 'package:api_action_item/shared/Loading.dart';
import 'package:flutter/material.dart';

import 'UserList.dart';

class HomeWithoutBloc extends StatefulWidget {
  @override
  _HomeWithoutBlocState createState() => _HomeWithoutBlocState();
}

class _HomeWithoutBlocState extends State<HomeWithoutBloc> {
  bool isLoading = true;
  List<User> users;

  void getUsers() async {
    setState(() {
      isLoading = true;
    });
    ResponseData responseData =
        await APIProvider().getCall(ReturnType.GET_USERS, GET_USERS);

    if (responseData.status == STATUS.SUCCESS) {
      setState(() {
        isLoading = false;
        var data = json.encode(responseData.data);
        var jsonArray = jsonDecode(data) as List;
        users =
            jsonArray.map((userObject) => User.fromJson(userObject)).toList();

        users.forEach((element) {
          print('users : ${element.name}');
        });
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  void addPost() async {
    setState(() {
      isLoading = true;
    });

    PostRequest postRequest =
        PostRequest(userId: 1, title: "abcd", body: "sdjfjhdsbfhbhdsbfhbhd");
    ResponseData responseData = await APIProvider().postCall(
        ReturnType.POST_ADD_POST, POST_ADD_POST, json.encode(postRequest));

    if (responseData.status == STATUS.SUCCESS) {
      setState(() {
        isLoading = false;
        var data = json.encode(responseData.data);
        var jsonObject = json.decode(data) as Map;

        print('response : ${data}');
      });
    } else if (responseData.status == STATUS.ERROR) {
      setState(() {
        isLoading = false;
        print('response : ${responseData.msg}');
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(SCREEN_HOME),
        centerTitle: true,
      ),
      body: isLoading
          ? Loading()
          : Container(
              padding: EdgeInsets.all(8.0),
              child: UserList(users: users),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPost();
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
