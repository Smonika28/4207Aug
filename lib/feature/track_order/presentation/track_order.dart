import 'package:flutter/material.dart';
import '../../../global_widget/Custom_product_list_cardWidget.dart';
import '../../../global_widget/custom_home_products_model.dart';
import '../../../utils/Api/api_calling/api_provider.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPage();
}

class _TrackOrderPage extends State<TrackOrderPage> {
  ApiProvider apiProvider = ApiProvider();
  FeaturedProducts featuredProducts = FeaturedProducts();
  List<dynamic> featureList = [];
  featureProductData() async {
    var resData = await apiProvider.getAllFeaturedProduct();
    setState(() {
      featuredProducts = resData;
      featureList = resData.data!;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Track Your Order",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const CustomProductListCardWidget();
            }),
      ),
    );
  }
}
