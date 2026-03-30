import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/my_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedListView(),
          const SizedBox(height: 50),
          Text('Best Seller', style: MyStyles.textStyle18),
          const SizedBox(height: 20),
          const BestSellerListViewItem(),
        ],
      ),
    );
  }
}


