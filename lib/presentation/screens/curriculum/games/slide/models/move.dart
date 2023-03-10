import 'package:esjourney/presentation/screens/curriculum/games/slide/models/slide.dart';

class Move {
  List<Slide> slides;

  Move({
    required this.slides,
  });

  factory Move.clone(Move source) {
    return Move(
      slides: source.slides.map((e) => Slide.clone(e)).toList(),
    );
  }
}
