import 'package:flutter/material.dart';
import 'package:four20society/global_widget/custom_product_cart_widget.dart';
import '../../../global_widget/app_drawar.dart';
import '../../../utils/Api/api_calling/api_provider.dart';
import '../../dashboard/presentation/dashboards.dart';

class ProductWishListScreen extends StatefulWidget {
  const ProductWishListScreen({super.key});
  @override
  State<ProductWishListScreen> createState() => _ProductWishListScreen();
}

class _ProductWishListScreen extends State<ProductWishListScreen> {
  ApiProvider apiProvider = ApiProvider();

  List<dynamic> wishlistProduct = [];
  getAllWishlistByCategory() async {
    var resData = await apiProvider.getAllWishlist();
    setState(() {
      wishlistProduct = resData!.data!;
    });
  }

  @override
  void initState() {
    super.initState();

    getAllWishlistByCategory();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: customDrawer(context: context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Wishlist",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
            // _scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: wishlistProduct.length,
          itemBuilder: (BuildContext context, int index) {
            var item = wishlistProduct[index];
            return CustomProductCardWidget(
              image:item.featuredImage![0].image??"",
              mainPrice: item.price.toString(),
              price: "${item.price - int.parse(item.discount)}",
              slug: item.slug,
              titileText: item.name,
              description: item.description,
              thcRange: item.thcRange,
              onTap: ()async{
                Map<String, dynamic> formData = {
                  "product_id": item.id.toString()
                };
                await ApiProvider().addProductList(formData);

              },
            );
          }),
    );
  }
}
