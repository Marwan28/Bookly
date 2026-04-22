import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final category =
        widget.bookEntity.categories?.isNotEmpty == true
            ? widget.bookEntity.categories![0]
            : 'programming';
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(bookEntity: widget.bookEntity),
      ),
    );
  }
}
