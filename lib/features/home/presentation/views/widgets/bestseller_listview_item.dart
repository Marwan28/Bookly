import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:go_router/go_router.dart';

class BestsellerListviewItem extends StatelessWidget {
  const BestsellerListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsScreen);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(AssetsData.testImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      'Harry Potter and the Goblet of Fire',
                      style: MyStyles.textStyle20,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text('J.K. Rowling', style: MyStyles.textStyle14),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '19.99 €',
                        style: MyStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
