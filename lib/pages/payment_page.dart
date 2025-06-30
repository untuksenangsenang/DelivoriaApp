import 'package:delivoria/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:delivoria/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // User wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"), // Changed to reflect confirmation step
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            // Yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                formKey.currentState!.reset(); // Reset form after confirmation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryProgressPage()),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    } else {
      // If form is invalid, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields correctly.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Credit card widget
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            cardBgColor: Theme.of(context).colorScheme.primary, // Added required parameter
            obscureCardNumber: true, // Added to mask card number
            obscureCardCvv: true, // Added to mask CVV
            isHolderNameVisible: true, // Added to show cardholder name
            onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Updated parameter
          ),
          // Credit card form
          CreditCardForm(
            formKey: formKey,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
                isCvvFocused = data.isCvvFocused; // Added to update card flip
              });
            },
          ),
          const Spacer(),
          MyButton(
            onTap: userTappedPay,
            text: "Pay Now",
          ),
        ],
      ),
    );
  }
}