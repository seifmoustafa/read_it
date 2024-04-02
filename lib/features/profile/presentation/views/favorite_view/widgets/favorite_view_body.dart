import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/favorite_cubit/favorite_cubit.dart';
import 'package:read_it/features/profile/presentation/views/favorite_view/widgets/favorite_item_list_view.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  _FavoriteViewBodyState createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<FavoriteCubit>(context).fetchFavoriteItems();
        setState(() {}); // This will rebuild the entire widget
      },
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              viewName: 'Favorites',
            ),
            FavoriteListView(),
          ],
        ),
      ),
    );
  }
}
