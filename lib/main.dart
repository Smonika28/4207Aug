// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:four20society/constants/routes/app_routes.dart';
// import 'package:four20society/constants/routes/routes_name.dart';
// import 'package:four20society/utils/local_storage/local_storage.dart';
// import 'feature/auth/login/bloc/seller_login_bloc.dart';
// import 'feature/auth/registration/bloc/seller_signup_bloc.dart';
//
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   final token = await LocalStorageService()
//       .getFromDisk(LocalStorageService.ACCESS_TOKEN_KEY) ??
//       "";
//   runApp(MyApp(token));
// }
//
//
// class MyApp extends StatelessWidget {
//   final authToken;
//   const MyApp(this.authToken, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
//         BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
//       ],
//       child: MaterialApp(
//         theme: ThemeData(
//             visualDensity: VisualDensity.standard,
//             useMaterial3: true
//         ),
//         title: '420 Society',
//         debugShowCheckedModeBanner: false,
//                onGenerateRoute: RoutesGenerator.generateRoute,
//        initialRoute:(authToken != null && authToken != '')?AppRoute.dashboardScreen:AppRoute.splaceScreen,
//          // initialRoute: AppRoute.dashboardScreen,
//         // home: MyTest(),
//       ),
//     );
//   }
// }
//
// class MyTest extends StatelessWidget {
//   const MyTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("test"),
//       ),
//       body: const Center(child: Text("Body Test")),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four20society/feature/welcome/splace_screen.dart';
import 'feature/auth/login/bloc/seller_login_bloc.dart';
import 'feature/auth/registration/bloc/seller_signup_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            visualDensity: VisualDensity.standard, useMaterial3: true),
        title: '420 Society',
        debugShowCheckedModeBanner: false,
        home: const SplaceScreen(),
      ),
    );
  }
}

class MyTest extends StatelessWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: const Center(child: Text("Body Test")),
    );
  }
}
