import 'package:flutter/material.dart';
import 'package:four20society/feature/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:four20society/feature/auth/login/presentaion/login_screen.dart';
import 'package:four20society/feature/auth/registration/presentaion/registration_screen.dart';
import 'package:four20society/feature/dashboard/presentation/dashboards.dart';
import 'package:four20society/feature/welcome/intro1_screen.dart';
import 'package:four20society/feature/welcome/intro2_screen.dart';
import 'package:four20society/feature/welcome/splace_screen.dart';
import 'package:four20society/global_widget/bottom_nav.dart';
import '../../feature/about_us/presentation/about_us.dart';
import '../../feature/address/presentation/added_address.dart';
import '../../feature/cart/presentation/cart_page.dart';
import '../../feature/category/presentaion/category.dart';
import '../../feature/change_password/presentation/change_password (1).dart';
import '../../feature/change_password/presentation/changedPassWord.dart';
import '../../feature/checkout/presentation/check_out_screen.dart';
import '../../feature/help_support/presentation/termcondition.dart';
import '../../feature/notification/presentation/notification_screen.dart';
import '../../feature/payment/presentation/paymentcard.dart';
import '../../feature/profile/presentaion/profile.dart';
import '../../feature/track_order/presentation/track_order.dart';
import '../../feature/wish_list/presentation/wishlist_page.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplaceScreen());
      case '/intro1Screen':
        return MaterialPageRoute(builder: (_) => const IntroOneScreen());
      case '/intro2Screen':
        return MaterialPageRoute(builder: (_) => const IntroTwoScreen());
      case '/addedAddress':
        return MaterialPageRoute(builder: (_) => const AddedAddress());
      case '/aboutUsPage':
        return MaterialPageRoute(builder: (_) => const AboutUsPage());
      case '/cardScreen':
        return MaterialPageRoute(builder: (_) => const CardScreen());
      case '/changePasswordScreen1':
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen1());
      case '/changedPassWord':
        return MaterialPageRoute(builder: (_) => const ChangedPassWord());
      case '/checkoutPage':
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case '/homePageWithBottomBar':
        return MaterialPageRoute(builder: (_) => const HomePageWithBottomBar());
      case '/forgetPassword':
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/notificationScreen':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case '/productCategoryScreen':
        return MaterialPageRoute(builder: (_) => const ProductCategoryScreen());
      case '/productWishListScreen':
        return MaterialPageRoute(builder: (_) => const ProductWishListScreen());
      case '/paymentCard':
        return MaterialPageRoute(builder: (_) => const PaymentCard());
      case '/trackOrderPage':
        return MaterialPageRoute(builder: (_) => const TrackOrderPage());
      case '/termConditionPage':
        return MaterialPageRoute(builder: (_) => const TermConditionPage());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case '/userProfileScreen':
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case "/dashboardScreen":
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${routeSettings.name}'),
                  ),
                ));
    }
  }
}
