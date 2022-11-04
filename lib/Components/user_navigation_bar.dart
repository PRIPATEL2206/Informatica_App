import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserNavigationBar extends StatefulWidget {
  final Function changePage;
  const UserNavigationBar({super.key, required this.changePage});
  @override
  State<UserNavigationBar> createState() =>
      _UserNavigationBarState(changePage: changePage);
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  static int _index = 0;
  final Function changePage;

  _UserNavigationBarState({required this.changePage});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      enableFeedback: true,
      type: BottomNavigationBarType.shifting,
      onTap: (value) {
        setState(() {
          _index = value;
          changePage(_index);
        });
      },
      fixedColor: Colors.orangeAccent,
      unselectedItemColor: Colors.orange,
      backgroundColor: Color.fromARGB(255, 231, 150, 28),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          label: "Schemes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: "Contect",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "FAQ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "User",
        ),
      ],
    );
  }
}
