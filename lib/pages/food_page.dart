import 'package:delivoria/components/my_button.dart';
import 'package:delivoria/models/food.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key,
  required this.food,})

  {
    //initalize selected addons to be
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold UI
      Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
        
            //food image
            Image.asset(widget.food.imagePath),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //food name
              Text(widget.food.name, 
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16,
                color: Theme.of(context).colorScheme.primary),
                ),
        
                //food price
                Text('\$${widget.food.price}', 
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16,
                color: Theme.of(context).colorScheme.primary),
                ),
              
              //food description
              Text(widget.food.description),
        
              const SizedBox(height: 10,),
        
              Divider(color: Theme.of(context).colorScheme.secondary),
              const SizedBox( height: 10,),
              
              //addons
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add-ons",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        //get individual addon
                        Addon addon = widget.food.availableAddons[index];
                    
                        //return check box UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('\$${addon.price}',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary,
                          ),),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon]= value!;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
              ],),
            ),
        
            //button -> add to cart
            MyButton(onTap: (){}, 
            text: "Add to cart"),

            const SizedBox(height: 25,)
          ],
        ),
      ),
    ),

      //back button
      SafeArea(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary, 
            shape: BoxShape.circle ),
          
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      )

    ],);
  }
}