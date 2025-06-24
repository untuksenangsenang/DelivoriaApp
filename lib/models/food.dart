// food items
class Food {
final String name; //cheeseburger, salad, fries, etc.
final String description; //description of the food item
final String imagePath; //lib/iamges/burger.png, etc.
final double price; //4.99
final FoodCategory category; //burgers
List<Addon> availableAddons; // [extra cheese, bacon, etc.]

Food({
  required this.name,
  required this.description,
  required this.imagePath,
  required this.price,
  required this.category,
  required this.availableAddons,
});
}

// food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}