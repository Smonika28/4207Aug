import 'package:flutter/material.dart';
import 'custom_bordered_button.dart';
import 'custom_unbordered_button.dart';

class CustomProductCartCardWidget extends StatelessWidget {
  const CustomProductCartCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Column(children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 102,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    "https://excellis.co.in/420-society-world/frontend_assets/images/canabi.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 180,
                      child: Text(
                        "Organic hemp flower Organic hemp flower ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const Text(
                      "\$152",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "57%",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 105),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xff00C8B8), width: 1)),
                            width: MediaQuery.of(context).size.width * 0.18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("plus pressed ----");
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Color(0xff00C8B8),
                                  ),
                                ),
                                const Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF00C8B8)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("minus pressed ----");
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: Color(0xff00C8B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    const Text("Hem",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
                  onTap: () {},
                  title: 'Add To Wishlist',
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // Spacer(),
                CustomBorderedElevatedButton(
                  onTap: () {},
                  title: 'Remove',
                ),
              ],
            ),

          ]
          ),

        ],
      ),



    );
  }
}
