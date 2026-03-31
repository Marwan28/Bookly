import 'package:bookly/core/utils/my_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';

class SimilarBoxSection extends StatelessWidget {
  const SimilarBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: MyStyles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListview(),
      ],
    );
  }
}