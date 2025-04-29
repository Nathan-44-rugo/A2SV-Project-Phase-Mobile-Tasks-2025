import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
        onPressed: (){
          Navigator.pushNamed(context, '/view');
        },
            icon: const Icon(Icons.view_agenda_outlined))
      ],
      automaticallyImplyLeading: true,
      backgroundColor: const Color.fromRGBO(0, 130, 195, 1),
      centerTitle: true,
      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
      title: const Text(
        'Sports eCommerce Platform',
        style: TextStyle(
          fontFamily: 'JetBrains Mono',
          fontSize: 24,
          letterSpacing: 1,
          overflow: TextOverflow.clip,
        ),
        textAlign: TextAlign.center,
      ),
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
