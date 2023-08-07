import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:four20society/feature/notification/presentation/notification_screen.dart';
import 'package:four20society/global_widget/app_drawar.dart';
import 'package:four20society/utils/Api/api_calling/api_provider.dart';
import '../../../constants/apis_path/api_config_string.dart';
import '../../../global_widget/Custom_product_list_cardWidget.dart';
import '../../../global_widget/Custom_product_list_cardWidget_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map> myProducts =
      List.generate(11, (index) => {"id": index, "name": "Product $index"})
          .toList();

  ApiProvider apiProvider = ApiProvider();
  List<dynamic> categoryList = [];
  void categoryData() async {
    var resData = await apiProvider.getAllCategory();

    log(resData.data!.toString());
    setState(() {
      categoryList = resData.data!;
    });
  }
  //
  // ProductModel productsList = ProductModel();
  // productData() async {
  //   var resData = await apiProvider.getAllProductList();
  //   setState(() {
  //     productsList = resData;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    categoryData();
    // productData();
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '420Society.world',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00c8b8))),
              TextSpan(
                text: '\n COMPANY TAGLINE HERE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      drawer: customDrawer(context: context),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xffCCF4F1),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      hintText: 'What would you like ?',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: const Color(0xff00C8B8).withOpacity(0.8),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                ),
              ),
            ],
          ),
          categoryList.isNotEmpty
              ? SizedBox(
            height: 115.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xff00C8B8),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(),
                            image: DecorationImage(
                                image: NetworkImage(ApiEndPoints.Storage +
                                    categoryList[index].image!))),
                      ),
                      Text(
                        categoryList[index].name!,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 39, 8, 8), fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ) :  const Center(
            child: CircularProgressIndicator.adaptive(),
    ),
          Container(
            height: _screenHeight * 0.9,
            margin: const EdgeInsets.all(12),
            child: ListView.builder(
                itemCount:10,
                itemBuilder: (BuildContext context, int index) {
                  // var item = productsList.data!;
                  return  const CustomProductListCardWidget(

                  );
                }),
          ),
        ],
      ),
    );
  }
}
