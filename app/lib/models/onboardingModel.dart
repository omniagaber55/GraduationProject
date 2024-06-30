class OnboardingInformation {
  final String title;

  final String image;

  OnboardingInformation({required this.title, required this.image});
}
class Onboarding_data {
  List<OnboardingInformation> items = [
    OnboardingInformation(
        title: "Biogas Production From \nSurplus Foo",
        image: "assets/images/Data processing-bro  (1).png"),
    OnboardingInformation(
        title: "Electricity Production From \nBiogas",
        image: "assets/images/Data processing-bro  (3).png"),
    OnboardingInformation(
        title: "Extracting Organic Fertilizer",
        image: "assets/images/Data processing-bro  (2).png"),
  ];
}