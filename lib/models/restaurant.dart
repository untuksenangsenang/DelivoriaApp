import 'package:collection/collection.dart';
import 'package:delivoria/models/cart_item.dart';
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
      name: "Aloha Burger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/alohaBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/bbqBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Bluemoon Burger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/bluemoonBurger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ],
    ),
    Food(
      name: "Vege Burger",
      description: "A juicy beef patty with melted cheese, lettuce, tomato, and our special sauce",
      imagePath: "lib/images/burgers/vegeBurger.jpg",
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
      name: "Greek Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Asian Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/asian_sesame_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: 1.20,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Parmesan", price: 0.60),
      ],
    ),
    Food(
      name: "Southwest Salad",
      description: "Crisp romaine lettuce with Caesar dressing and croutons",
      imagePath: "lib/images/salads/southwest_salad.png",
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
      name: "Garlic Bread Side",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/garlic_bread_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Mac Side",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/mac_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Onion Rings",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/onion_rings_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
     Food(
      name: "Sweet Potato",
      description: "Golden crispy fries",
      imagePath: "lib/images/sides/sweet_potato_side.png",
      price: 0.80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.40),
      ],
    ),
    // Drinks
    Food(
      name: "Americano Coffee",
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
      name: "Lychee Tea",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/lyche_tea.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
     Food(
      name: "Matcha",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/matcha.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ),
     Food(
      name: "Pink Mojito",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/pink_mojito.png",
      price: 0.60,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.10),
        Addon(name: "Extra Shot", price: 0.50),
      ],
    ), 
    Food(
      name: "Vanilla Latte",
      description: "A rich and bold Americano coffee made with freshly brewed espresso and hot water",
      imagePath: "lib/images/drinks/vanilla_latte.png",
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
  List<CartItem> get cart => _cart;

  /*

  O P E R A T I O N S

  */

  //user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check id the same food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons = 
      ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
      notifyListeners();
    }
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice(){
    double total = 0.0;
    
    for  (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total  += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
    }


  /*

  H E L P E R S

  */

  //generate a receipt

  //format double value into 

  //fotmat list of food items into a string

}