import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomProductListCardWidget extends StatefulWidget {
  const CustomProductListCardWidget({super.key});

  @override
  State<CustomProductListCardWidget> createState() =>
      _CustomProductListCardWidgetState();
}

class _CustomProductListCardWidgetState
    extends State<CustomProductListCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.29,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                "https://excellis.co.in/420-society-world/public/storage/products/1678694791_46354_cbccf6fe-b40c-4e8b-9e62-30ebdd300a62.jfif",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  width: 150,
                  child: RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const SizedBox(
                  width: 180,
                  child: Text(
                    "Organic hemp flower Organic hemp flower ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "\$152",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "   Out of stock",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "57%",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ]),
                const Text("Hem",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            Column(
              children: [
                const Icon(Icons.favorite_border_rounded, size: 16),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    minRadius: 14,
                    backgroundColor: Color(0xFF00C8B8),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
                // Icon(Icons.favorite_border_rounded, size: 16),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
