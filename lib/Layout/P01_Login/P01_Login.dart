import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../cubit/shared_preferance_cubit.dart';
import '../../components/Component_Layout/frame/frame.dart';

class LogInpage extends StatefulWidget {
  const LogInpage({super.key});

  @override
  State<LogInpage> createState() => _LogInpageState();
}

final TextEditingController _textControllerEmail = TextEditingController();
final TextEditingController _textControllerPassword = TextEditingController();

List<String> email_pass = []; //ส่งไปcheck ที่cubit

class _LogInpageState extends State<LogInpage> {
  @override
  Widget build(BuildContext context) {
    double maxheight = MediaQuery.of(context).size.height;
    return KeyboardVisibilityBuilder(builder: (context, visible) {
      print(visible);
      return WidgetFrame(
        modeFrame: 3,
        bgBody: Color(0xfffbcbb0),
        body: visible == false
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      //   alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 500, // maxheight < 650 ? 440 : 500,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 30),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: maxheight > 670 ? 10 : 70,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: 340,
                                  child: TextField(
                                    onChanged: (String data) {
                                      if (kDebugMode) {
                                        print(data);
                                      }
                                    },
                                    autofocus: true,
                                    controller: _textControllerEmail,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Emal',
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: 340,
                                  child: TextField(
                                    scrollPadding: EdgeInsets.all(16.0),
                                    obscureText: true,
                                    onChanged: (String data) {
                                      if (kDebugMode) {
                                        print(data);
                                      }
                                    },
                                    controller: _textControllerPassword,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                  onTap: () {
                                    email_pass.insert(
                                        0, _textControllerEmail.text);
                                    email_pass.insert(
                                        1, _textControllerPassword.text);
                                    context
                                        .read<SharedPreferanceCubit>()
                                        .SaveText(email_pass);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 340,
                                    decoration: BoxDecoration(
                                      color: Color(0xff334d00),
                                      border: Border.all(width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20.0) //                 <--- border radius here
                                          ),
                                    ),
                                    child: Text(' Submit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: maxheight < 650 ? 5 : 10,
                    left: 25,
                    child: Image.asset(
                      'assets/images/plants.png',
                      fit: BoxFit.fitHeight,
                      height: 300,
                      width: 350,
                    ),
                  ),
                ],
              )
            : Container(
                height: maxheight,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10, // maxheight > 670 ? 50 : 10,
                      ),
                      Image.asset(
                        'assets/images/plants.png',
                        fit: BoxFit.fitHeight,
                        height: 300,
                        width: 350,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //   alignment: Alignment.bottomCenter,
                          child: Container(
                            height: maxheight < 650 ? 440 : 500,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 30),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 340,
                                    child: TextField(
                                      onChanged: (String data) {
                                        if (kDebugMode) {
                                          print(data);
                                        }
                                      },
                                      autofocus: true,
                                      controller: _textControllerEmail,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Emal',
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 340,
                                    child: TextField(
                                      scrollPadding: EdgeInsets.all(16.0),
                                      obscureText: true,
                                      onChanged: (String data) {
                                        if (kDebugMode) {
                                          print(data);
                                        }
                                      },
                                      controller: _textControllerPassword,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                      ),
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: InkWell(
                                    onTap: () {
                                      email_pass.insert(
                                          0, _textControllerEmail.text);
                                      email_pass.insert(
                                          1, _textControllerPassword.text);
                                      context
                                          .read<SharedPreferanceCubit>()
                                          .SaveText(email_pass);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 340,
                                      decoration: BoxDecoration(
                                        color: Color(0xff334d00),
                                        border: Border.all(width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                20.0) //                 <--- border radius here
                                            ),
                                      ),
                                      child: Text(' Submit',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}
