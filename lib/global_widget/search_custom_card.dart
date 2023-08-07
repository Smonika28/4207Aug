import 'package:flutter/material.dart';
import 'package:four20society/global_widget/custom_button.dart';

class SearchCustomCardWidget extends StatefulWidget {
  const SearchCustomCardWidget({super.key});

  @override
  State<SearchCustomCardWidget> createState() => _SearchCustomCardWidgetState();
}

class _SearchCustomCardWidgetState extends State<SearchCustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Container(
      // height: 200,
      width: 220,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 46),
            decoration: const BoxDecoration(
              color: Color(0xFF00C8B8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(360),
                topRight: Radius.circular(360),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/product_pic.png",
                  fit: BoxFit.fill,
                  width: 175,
                  height: 131,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '25% ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 42),
                      ),
                      TextSpan(
                        text: 'off\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      TextSpan(
                        text: 'Lorem Ispum Dolor\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '\$ 152',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}