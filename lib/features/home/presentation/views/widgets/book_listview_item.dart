import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/my_styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListviewItem extends StatelessWidget {
  const BookListviewItem({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsScreen,
          extra: bookEntity,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CustomBookImage(imageUrl: bookEntity.image ?? ''),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookEntity.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: MyStyles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookEntity.authorName ?? '',
                    style: MyStyles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        bookEntity.price != null && bookEntity.price! > 0
                            ? '${bookEntity.price} €'
                            : 'Free',
                        style: MyStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: (bookEntity.rating ?? 0).toInt(),
                        count: (bookEntity.rating ?? 0).toInt(),
                      ),
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
