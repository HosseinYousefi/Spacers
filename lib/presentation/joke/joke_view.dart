import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';
import '../../application/joke/joke_bloc.dart';
import '../../common/ninja_card.dart';
import '../../domain/joke/joke.dart';

class JokeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final jokeBloc = useProvider(jokeBlocProvider);
    final state = useProvider(jokeBlocProvider.state);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'first',
            onPressed: () {
              jokeBloc.randomJokePressed();
            },
            child: Icon(Icons.ac_unit),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'second',
            onPressed: () {
              context.yeet('/favorites');
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: state.when(
          noJoke: () => Text('Press the button to get a joke!'),
          loading: () => CircularProgressIndicator(),
          hasJoke: (joke, isLiked) => JokeCard(
            joke: joke,
            isLiked: isLiked,
          ),
        ),
      ),
    );
  }
}

class JokeCard extends HookWidget {
  final Joke joke;
  final bool isLiked;

  JokeCard({
    required this.joke,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    final jokeBloc = useProvider(jokeBlocProvider);
    return Container(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(joke.joke),
              IconButton(
                onPressed: () {
                  jokeBloc.likedPressed(joke);
                },
                color: isLiked ? Colors.red : Colors.grey,
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
