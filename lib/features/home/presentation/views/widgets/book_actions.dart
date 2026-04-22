import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    final hasPreview = bookEntity.previewLink != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              text: hasPreview ? 'Preview' : 'Not Available',
              fontSize: 16,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: hasPreview
                  ? () async {
                      await launchCustomUrl(
                          context, bookEntity.previewLink);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
