import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/components/background.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:hms/share/remote/cache_helper.dart';
import 'package:lottie/lottie.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is LoginAdminDataSucsses) {
          CacheHelper.setData(key: ktokenApi, value: state.token!);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        } else if (state is LoginAdminDataError) {
          Fluttertoast.showToast(
              msg: " الاسم او الباسورد غير صحيح ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Background(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        width: 300,
                        height: 300,
                        child: Lottie.asset('assets/images/login2.json')),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "تسجيل دخول",
                      style: TextStyle(
                          fontSize: 25,
                          color: kMainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    inputItem('الاسم', nameController),
                    inputItem('كلمة المرور ', passwordController,
                        isPassword: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            PatientCubit.get(context).loginAdminData(
                                nameController.text, passwordController.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: state is LoginAdminDataLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text(
                                    'تسجيل الدخول  ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kMainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            fixedSize: Size(0, 45),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget inputItem(String text, TextEditingController txtControl,
      {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: txtControl,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: () {},
                        child: Icon(Icons.visibility),
                      )
                    : null,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(72, 175, 218, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
