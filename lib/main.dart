import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecase/fetch_feature_books_usecase.dart';
import 'package:bookly_app/Features/home/domain/usecase/fetch_news_books_usecase.dart';
import 'package:bookly_app/Features/home/presentation/manger/cubit/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/cubit/news_books_cubits/news_books_cubit.dart';
import 'package:bookly_app/constance.dart';
import 'package:bookly_app/core/functions/bloc_observer.dart';
import 'package:bookly_app/core/functions/services_locator.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  saveLocator();

  await Hive.openBox<BookEntity>(featuredBooks);
  await Hive.openBox<BookEntity>(newestBooks);
 Bloc.observer=SingleBlocObserver();
  runApp(const BooklyAPP());
}





class BooklyAPP extends StatelessWidget {
  const BooklyAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeatureBookCubit(
              FetchFeatureBooksUsecase(
                (getIt.get<HomeRepoImpl>()),
              ),
            )..fetchFeatureBook();
          },
        ),
        BlocProvider(create: (context) {
          return NewsBooksCubit(
            FetchNewsBooksUsecase(
              getIt.get<HomeRepoImpl>(),
            ),
          );
        })
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          //hna 3shan ael lwan wa7d blzbt
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
              ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
