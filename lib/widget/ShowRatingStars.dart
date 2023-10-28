import 'package:flutter/material.dart';

class ShowRatingStars extends StatelessWidget {
  final double rating;

  ShowRatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        double starValue = index + 1;

        // Determine the icon for the star based on the rating value
        Icon starIcon;
        if (starValue <= rating) {
          starIcon = Icon(Icons.star, color: Colors.amber);
        } else if (starValue - 0.5 <= rating) {
          starIcon = Icon(Icons.star_half, color: Colors.amber);
        } else {
          starIcon = Icon(Icons.star_border, color: Colors.amber);
        }

        return starIcon;
      }),
    );
  }
}