import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<Widget> cards;
  const CustomListView({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenHeight * 0.62,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount:
                      cards.length, // Replace with the actual number of cards
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        cards[index],
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            );
  }
}