import 'package:flutter/material.dart';
import 'package:four20society/constants/colors/app_colors.dart';
import 'package:four20society/feature/auth/login/presentaion/login_screen.dart';
import '../../global_widget/bottom_nav.dart';
import '../../utils/local_storage/local_storage.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  String userToken = "";
  void getTokenId()async{
    final token = await LocalStorageService().getFromDisk(
        LocalStorageService.ACCESS_TOKEN_KEY) ??
        "";
    setState(() {
      userToken = token;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokenId();
  }
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5)).then((val) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> userToken.isNotEmpty && userToken!=null && userToken != ""? const HomePageWithBottomBar(): const LoginScreen()));
    });
    return Scaffold(
        body: Center(
      child: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: '420Society.world\n',
                style: TextStyle(
                    color: AppColors.app_bottombar_color,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'COMPANY TAGLINE HERE',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  letterSpacing: 0.9,
                ))
          ],
        ),
      ),
    ));
  }
}

@override
initState() {}
