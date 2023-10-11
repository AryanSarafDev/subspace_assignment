import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 0,
        centerTitle: false,
        backgroundColor: Color.fromRGBO(27, 27, 27, 1),
        title: SizedBox(
            height: 150,width: 200,
            child: Image.asset("assets/subspaceLogo.png")),
      ),endDrawer: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
    );
  }
}
