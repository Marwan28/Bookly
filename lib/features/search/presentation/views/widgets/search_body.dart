import 'package:bookly/core/utils/my_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(height: 16),
          Text('Search Result', style: MyStyles.textStyle18),
          const SizedBox(height: 16),
          const Expanded(child: SearchResultListview()),
        ],
      ),
    );
  }
}

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // TODO: wire up search cubit and pass real BookEntity here
          child: Text('data'),
        );
      },
    );
  }
}
