import 'package:bookly/core/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final int rating;
  final int count;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, size: 14, color: Color(0xffFFDD4F)),
        SizedBox(width: 6.3),
        Text('$rating', style: MyStyles.textStyle16),
        SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text('($count)', style: MyStyles.textStyle14),
        ),
      ],
    );
  }
}
