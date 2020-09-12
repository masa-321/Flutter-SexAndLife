import 'package:flutter/material.dart';
import 'package:sex_and_life/components/widget_category.dart';
import 'package:sex_and_life/components/widget_latest_articles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sex_and_life/services/data_state.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnon() async {
    //firebaseAuth.signInAnonymously()で返されるのはAuthResultクラス。
    final AuthResult result = await firebaseAuth.signInAnonymously();
    //AuthResultクラスの中に、userとadditionalUserInfoと言うメンバがある。
    return result.user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInAnon().then((FirebaseUser user) {
      print('User ${user.uid}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //TODO カテゴリーを設置
            Container(
              height: 88,
              //color: Color(0xFFF1F5F9),
              width: MediaQuery.of(context).size.width,
              child: WidgetCategory(),
            ),
            WidgetLatestArticles()
          ],
        ),
      ),
    );
  }
}


