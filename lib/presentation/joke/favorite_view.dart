import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/favorite/favorite_bloc.dart';

class FavoriteView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(favoriteBlocProvider.state);
    final favoriteBloc = useProvider(favoriteBlocProvider);

    // final isMounted = useIsMounted();

    Future.delayed(Duration(milliseconds: 200))
        .then((value) => favoriteBloc.getAllFavorites());

    // useEffect(() {
    //   if (isMounted()) {
    //     ;
    //   }
    // }, []);

    return Scaffold(
      body: ListView.builder(
        itemCount: state.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state[index].joke),
          );
        },
      ),
    );
  }
}
