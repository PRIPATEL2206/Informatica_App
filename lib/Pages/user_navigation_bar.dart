import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatica/Pages/FAQPage/faq_page.dart';
import 'package:informatica/Pages/HomePage/home_page.dart';
import 'package:informatica/Pages/SchemePage/schemes_page.dart';
import 'package:informatica/Pages/SettingPage/setting_page.dart';

class UserNavigationBar extends StatefulWidget {
  final Function changePage;
  const UserNavigationBar({super.key, required this.changePage});
  @override
  State<UserNavigationBar> createState() => _UserNavigationBarState();
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  static int _index = 0;

  _UserNavigationBarState();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      enableFeedback: true,
      type: BottomNavigationBarType.shifting,
      onTap: (value) {
        setState(() {
          _index = value;

          switch (_index) {
            case 0:
              widget.changePage(const HomePage());
              break;
            case 1:
              widget.changePage(const SchemesPage());
              break;
            case 2:
              widget.changePage(const HomePage());
              break;
            case 3:
              widget.changePage(const FAQPage());
              break;
            case 4:
              widget.changePage(const SettingPage());
              break;

            default:
              widget.changePage(const HomePage());
          }
        });
      },
      fixedColor: Colors.orangeAccent,
      unselectedItemColor: Colors.orange,
      backgroundColor: const Color.fromARGB(255, 231, 150, 28),
      items: const [
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
          icon: Icon(CupertinoIcons.settings),
          label: "Setting",
        ),
      ],
    );
  }
}
