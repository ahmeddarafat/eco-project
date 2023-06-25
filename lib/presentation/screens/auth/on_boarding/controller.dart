import 'model.dart';

class OnBoardingController
{
  int currentPage = 0;

  List<OnBoarding> models=
  [
    OnBoarding(
        imageUrl: "assets/images/on_boarding1.png",
        title: "Wait for your device to be approved, \nthen go to the drop-off location and \nredeem your voucher.",
      background: "assets/images/Vector.png"
    ),
    OnBoarding(
        imageUrl: "assets/images/on_boarding2.png",
        title: "Choose a coupon from any of our \npartners, check their discounts, choose \nthe location, and send it.",
        background: "assets/images/Vector2.png"
    ),
    OnBoarding(
        imageUrl: "assets/images/on__boarding3.png",
        title: "Add your old electronic devices and add \nyour device details.",
        background: "assets/images/Vector3.png"
    )
  ];
}