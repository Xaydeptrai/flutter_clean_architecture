import 'package:equatable/equatable.dart';

class MovieData with EquatableMixin {

  final int id;
  final String title;
  final double rating;
  final String posterUrl;

  const MovieData({
    required this.id,
    required this.title,
    required this.rating,
    required this.posterUrl
  });

  @override
  List<Object> get props => [
    id,
    title,
    rating,
    posterUrl
  ];

}