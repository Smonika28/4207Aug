import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCard();
}

class _PaymentCard extends State<PaymentCard> {
  get value => null;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 10, left: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 211, 209, 209).withOpacity(0.4),
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "ICIC Bank Credit card",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/bank_logo.png',
                          width: 30, height: 30, fit: BoxFit.fill),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "**** **** **** 1234",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "No cost  EMI at \$15/ month",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      const Text(
                        "cvv",
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.question_mark,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
              top: 10,
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 10, left: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 211, 209, 209).withOpacity(0.4),
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                              focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                              value: 1,
                              groupValue: null,
                              onChanged: (value) {


                                // setState(() {
                                //   value = value;
                                //
                                //   // _radioValue = value as int;
                                // });
                              },
                            ),
                         // InkWell(
                            //   onTap: () {},
                            //   child: Container(
                            //     width: 20,
                            //     height: 20,
                            //     decoration: const BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Color(0xff00C8B8),
                            //     ),
                            //     child: const Icon(
                            //       Icons.circle,
                            //       color: Colors.white,
                            //       size: 18,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              width: 50,
                            ),
                            Row(children: [
                              Image.asset(
                                'assets/images/credit_logo.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Net Banking",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 10, left: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [

                            Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => const Color(0xff00C8B8)),
                              focusColor: MaterialStateColor.resolveWith((states) => Colors.green),

                              // fillColor: MaterialStateProperty.all(Colors.red),
                              // groupValue: null,
                              // onChanged: (v) => setState(() => null),
                              // onChanged: (value) {
                              //   setState(() {
                              //     // _radioValue = value as int;
                              //   });
                              // },
                              value: 0,
                              groupValue: value,
                               onChanged: (v) => setState(() => _PaymentCard() ),
                            ),


                            // InkWell(
                            //   onTap: () {},
                            //   child: Container(
                            //     width: 20,
                            //     height: 20,
                            //     decoration: const BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Color(0xff00C8B8),
                            //     ),
                            //     // child: const Icon(
                            //     //   Icons.circle,
                            //     //   color: Colors.white,
                            //     //   size: 18,
                            //     // ),
                            //
                            //
                            //
                            //     // child: Checkbox(
                            //     //    value: null,
                            //     //   onChanged: (value) {
                            //     //     setState(() {
                            //     //       // _value = value!;
                            //     //     });
                            //     //   },
                            //     //   activeColor: Colors.white,
                            //     //   checkColor: Colors.black,
                            //     //   testate: false,
                            //     // ),
                            //   ),
                            // ),
                            const SizedBox(
                              width: 50,
                            ),
                            Row(children: [
                              Image.asset(
                                'assets/images/salary_logo.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Cash On Delivery",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 260,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 10, left: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Material(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    foregroundColor: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff00C8B8),
                    minimumSize: const Size(double.infinity, 55.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    textStyle: Theme.of(context).textTheme.button?.copyWith(
                          fontSize: 15.0,
                        ),
                  ),
                  child: const Text(
                    'SET AS DEFAULT >',
                  ),
                ),
              ),
            ),
            Container()
          ],
        ),
      ]),
    );
  }
}


// import 'package:flutter/material.dart';
// void main() => runApp(const MyApp(key: null,));
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({required Key key}) : super(key: key);
//   static const String _title = 'Radio buttons';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         hintColor: Colors.black,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(key: null,),
//         ),
//       ),
//     );
//   }
// }
// enum Pet { dog, cat }
// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({required Key key}) : super(key: key);
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final Pet _pet = Pet.dog;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//
//       children: <Widget>[
//         ListTile(
//           title: const Text('Dog'),
//           leading: Radio<Pet>(
//             value: Pet.dog,
//             groupValue: _pet,
//             onChanged: (){},
//             // (Pet value) {
//             //   setState(() {
//             //     _pet = value;
//             //   });
//             // },
//           ),
//         ),
//         ListTile(
//           title: const Text('Cart'),
//           leading: Radio<Pet>(
//             value: Pet.cat,
//             groupValue: _pet,
//             onChanged: () {},
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
// @override
// Widget build(BuildContext context) {
//   if (this.direction == Axis.vertical) {
//     return Column(
//       children: _group,
//     );
//   }
//
//   return Row(
//     mainAxisAlignment: this.horizontalAlignment,
//     children: _group,
//   );
// }
//
// class _group {
// }
// }

