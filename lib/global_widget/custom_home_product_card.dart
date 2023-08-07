import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/apis_path/api_config_string.dart';
import '../utils/Api/api_calling/api_provider.dart';

class CustomHomeProductCardWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String titileText;
  final String price;
  final String mainPrice;
  final String thcRange;
  final String slug;
  final String image;

  const CustomHomeProductCardWidget(
      {super.key,
      this.onPressed,
      required this.mainPrice,
      required this.price,
      required this.slug,
      required this.thcRange,
      required this.titileText,
      required this.image});

  @override
  State<CustomHomeProductCardWidget> createState() =>
      _CustomHomeProductCardWidgetState();
}

class _CustomHomeProductCardWidgetState
    extends State<CustomHomeProductCardWidget> {
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 220,
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0XFFF9F9F9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87.withOpacity(0.05),
                  offset: const Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 5),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 99,
                child: CachedNetworkImage(
                  imageUrl: "${ApiEndPoints.Storage}${widget.image}",
                  width: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
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
              Text(
                widget.titileText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "\$ ${widget.mainPrice}",
                    style: const TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Text(
                "${widget.thcRange}% THC",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.slug,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      minRadius: 20,
                      backgroundColor: Color(0xFF00C8B8),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
