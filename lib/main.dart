import 'package:food_hub/features/auth_pages.dart';
import 'package:food_hub/features/splash_screen.dart';
import 'package:food_hub/features/onboarding_page.dart';
import 'package:food_hub/features/welcome_page.dart';
import 'package:food_hub/features/login_page.dart';
import 'package:food_hub/features/home_screen.dart';
import 'package:food_hub/features/category_page.dart';
import 'package:food_hub/features/search_pages.dart';
import 'package:food_hub/features/restaurant_profile_page.dart';
import 'package:food_hub/features/food_details_page.dart';
import 'package:food_hub/features/cart_page.dart';
import 'package:food_hub/features/payment_pages.dart';
import 'package:food_hub/features/profile_page.dart';
import 'package:food_hub/features/order_pages.dart';
import 'package:food_hub/features/map_pages.dart';
import 'package:food_hub/features/address_pages.dart';
import 'package:food_hub/features/favorites_pages.dart';
import 'package:food_hub/features/review_pages.dart';
import 'package:food_hub/features/side_menu_page.dart';
import 'package:food_hub/features/cancel_page.dart';
import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FoodHubApp());

class FoodHubApp extends StatelessWidget {
  const FoodHubApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'FoodHub', debugShowCheckedModeBanner: false,
    initialRoute: Routes.splash,
    routes: {
      Routes.splash: (_) => const SplashScreen(),
      Routes.onboarding: (_) => const OnboardingPage(),
      Routes.welcome: (_) => const WelcomePage(),
      Routes.login: (_) => const LoginPage(),
      Routes.signup: (_) => const SignUpPage(),
      Routes.verification: (_) => const VerificationPage(),
      Routes.resetPassword: (_) => const ResetPasswordPage(),
      Routes.phoneRegistration: (_) => const PhoneRegistrationPage(),
      Routes.homeScreen: (_) => const HomeScreen(),
      Routes.sideMenu: (_) => const SideMenuPage(),
      Routes.category: (_) => const CategoryPage(),
      Routes.searchRestaurant: (_) => const SearchRestaurantPage(),
      Routes.searchFood: (_) => const SearchFoodPage(),
      Routes.foodDetails: (_) => const FoodDetailsPage(),
      Routes.restaurantProfile: (_) => const RestaurantProfilePage(),
      Routes.cart: (_) => const CartPage(),
      Routes.payment: (_) => const PaymentPage(),
      Routes.addNewCard: (_) => const AddNewCardPage(),
      Routes.scanCard: (_) => const ScanCardPage(),
      Routes.profile: (_) => const ProfilePage(),
      Routes.myOrdersHistory: (_) => const MyOrdersHistoryPage(),
      Routes.myOrdersUpcoming: (_) => const MyOrdersUpcomingPage(),
      Routes.orderDetails: (_) => const OrderDetailsPage(),
      Routes.myOrderEmpty: (_) => const MyOrderEmptyPage(),
      Routes.mapOrderTracking: (_) => const MapOrderTrackingPage(),
      Routes.mapView: (_) => const MapViewPage(),
      Routes.filter: (_) => const FilterPage(),
      Routes.deliveryAddress: (_) => const DeliveryAddressPage(),
      Routes.addNewAddress: (_) => const AddNewAddressPage(),
      Routes.search: (_) => const SearchPage(),
      Routes.cancelNow: (_) => const CancelNowPage(),
      Routes.favoritesFoodItems: (_) => const FavoritesFoodItemsPage(),
      Routes.favoritesRestaurants: (_) => const FavoritesRestaurantsPage(),
      Routes.rating: (_) => const RatingPage(),
      Routes.reviews: (_) => const ReviewsPage(),
      Routes.reviewFood: (_) => const ReviewFoodPage(),
      Routes.reviewRestaurant: (_) => const ReviewRestaurantPage(),
    },
  );
}
