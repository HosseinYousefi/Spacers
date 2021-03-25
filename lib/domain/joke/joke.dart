import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@freezed
abstract class Joke with _$Joke {
  const factory Joke({
    required String joke,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
