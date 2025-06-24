import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/cheeseBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/cheeseBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/cheeseBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/cheeseBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/cheeseBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    // Salads
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    // Sides
     Food(
      name: "Loaded Fries",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Loaded Fries",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Loaded Fries",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Loaded Fries",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Loaded Fries",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
    // Drinks
    Food(
      name: "Amercano Coffee",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/americano.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
     Food(
      name: "Amercano Coffee",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/americano.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
     Food(
      name: "Amercano Coffee",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/americano.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
     Food(
      name: "Amercano Coffee",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/americano.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ), 
    Food(
      name: "Amercano Coffee",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/americano.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
  ];

  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;

  /*

  O P E R A T I O N S

  */

  //add to cart

  //remove from cart

  //get total price of cart

  //get total items in cart

  //clear cart


  /*

  H E L P E R S

  */

  //generate a receipt

  //format double value into 

  //fotmat list of food items into a string

}