import 'package:bookly_app/core/helpers/custom_snack_bar.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksBlocConsumer extends StatefulWidget {
  const FeaturedBooksBlocConsumer({super.key});

  @override
  State<FeaturedBooksBlocConsumer> createState() =>
      _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBooksBlocConsumer> {
  bool isLoading = false;
  var nextPage = 1;
  late final ScrollController _scrollController;
  List<BookEntity> books = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FetchFeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchFeaturedBooksPaginationFailure){
          customSnackBar(context, state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess ||
            state is FetchFeaturedBooksPaginationLoading ||
            state is FetchFeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
              scrollController: _scrollController, books: books);
        } else if (state is FetchFeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}

