import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/views/screens/home_screen.dart';
import 'package:bookly/features/search/presentation/views/screens/search_screen.dart';
import 'package:bookly/features/splash/presentation/views/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashScreen = '/';
  static const String kHomeScreen = '/home';

  static const String kBookDetailsScreen = '/bookDetails';
  static const String kSearchScreen = '/search';

  static final router = GoRouter(
    routes: [
      GoRoute(path: kSplashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(path: kHomeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: kBookDetailsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsScreen(bookModel: state.extra as BookModel,),
        ),
      ),
      GoRoute(path: kSearchScreen, builder: (context, state) => SearchScreen()),
    ],
  );
}
