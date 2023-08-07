import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:four20society/utils/Api/api_calling/api_provider.dart';
import '../constants/apis_path/api_config_string.dart';
import 'custom_bordered_button.dart';
import 'custom_unbordered_button.dart';

class CustomProductCardWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String titileText;
  final String price;
  final String mainPrice;
  final String slug;
  final String description;
  final String thcRange;
  final String image;

  final VoidCallback onTap;
  const CustomProductCardWidget(
      {super.key,
      this.onPressed,
      required this.mainPrice,
      required this.price,
      required this.slug,
      required this.titileText,
      required this.description,
      required this.image,
      required this.thcRange,
      required this.onTap});

  @override
  State<CustomProductCardWidget> createState() =>
      _CustomProductCardWidgetState();
}

class _CustomProductCardWidgetState extends State<CustomProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 102,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              // child: Image.network(
              //   "https://excellis.co.in/420-society-world/frontend_assets/images/canabi.png",
              //   fit: BoxFit.fill,
              // ),
              child: CachedNetworkImage(
                 imageUrl: "${ApiEndPoints.Storage}${widget.image}",
                width: double.infinity,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    widget.titileText,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  "\$ ${widget.price}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.thcRange}% THC",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(widget.slug,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ],
        ),

        //buttons
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomUnBorderedElevatedButton(
              onTap: widget.onTap,
              title: 'Add To Cart',
            ),
            CustomBorderedElevatedButton(
              onTap: () {},
              title: 'Remove',
            ),
          ],
        ),
      ]),
    );
  }
}

//increment decrement button (code)

// const SizedBox(width: 105),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text(
// // "57%",
// "${widget.thcRange}% THC",
// style:const  TextStyle(
// fontSize: 14, fontWeight: FontWeight.w400),
// ),
// const SizedBox(width: 60),
// Container(
// padding: const EdgeInsets.all(4),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// border: Border.all(
// color: const Color(0xff00C8B8), width: 1)),
// width: MediaQuery.of(context).size.width * 0.18,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// GestureDetector(
// onTap: () {
// print("plus pressed ----");
// },
// child: const Icon(
// Icons.add,
// size: 18,
// color: Color(0xff00C8B8),
// ),
// ),
// const Text(
// "1",
// style: TextStyle(
// fontSize: 14, color: Color(0xFF00C8B8)),
// ),
// GestureDetector(
// onTap: () {
// print("minus pressed ----");
// },
// child: const Icon(
// Icons.remove,
// size: 18,
// color: Color(0xff00C8B8),
// ),
// ),
// ],
// ),
// ),
// ]),
