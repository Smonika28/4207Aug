import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool autoImplyLeading;

  const CustomAppBar({Key? key, required this.title, this.autoImplyLeading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoImplyLeading,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title, style: const TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
