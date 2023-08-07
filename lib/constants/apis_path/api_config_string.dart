
// ignore_for_file: constant_identifier_names

class ApiEndPoints{
  ApiEndPoints._();
  static const String Storage ="https://excellis.co.in/420-society-world/public/storage/";
  static const String BASE_URL = "https://excellis.co.in/420-society-world/";
  static const String login = "${BASE_URL}api/v1/login";
  static const String fetchBranches = "${BASE_URL}dashboard/branches";
  static const String userProfile = "${BASE_URL}user/profile";
  static const String dashboard = "${BASE_URL}dashboard";
  static const String signup = "${BASE_URL}api/v1/register";
  static const String category="${BASE_URL}api/v1/home/category";
  static const String featuredProduct="${BASE_URL}api/v1/home/featured-product";
  static const String todayDeals = "${BASE_URL}api/v1/home/today-deals";
  static const String productCategory="${BASE_URL}api/v1/home/product-by-category";
  static const String wishlistProduct="${BASE_URL}api/v1/wishlist/list";
  static const String addWishList="${BASE_URL}api/v1/wishlist/add";
  static const String profileApi="${BASE_URL}api/v1/customer/profile";
  static const String aboutUsApi="${BASE_URL}api/v1/cms/about-us";
  static const String termConditionApi="${BASE_URL}api/v1/cms/terms-conditions";
  static const String productList="${BASE_URL}api/v1/product/product-details";
  static const String editProfile="${BASE_URL}api/v1/customer/profile-update";
  static const String changePassword="${BASE_URL}api/v1/seller/change-password";
}
