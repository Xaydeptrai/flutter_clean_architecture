import 'package:flutter/material.dart';
import 'package:imdb/domain/entities/movie_data.dart';
import 'package:imdb/library/resource/colors.dart';
import 'package:imdb/library/resource/typography.dart';

class MovieItem extends StatelessWidget {
  const MovieItem ({
    required this.movieData,
    required this.index,
    super.key
  });

  final MovieData movieData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 315,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            blurRadius: 4,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            movieData.posterUrl,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  index.toString(),
                  style: AppTypography.text,
                ),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 2,),
                    Text(
                      movieData.rating.toString(),
                      style: AppTypography.smallText2,
                    )
                  ],
                ),
                const SizedBox(height: 4,),
                Text(
                  movieData.title,
                  maxLines: 2,
                  softWrap: true,
                  style: AppTypography.smallText,
                )
              ],
            ),
          ),
          const SizedBox(height: 2,)
        ],
      ),
    );
  }
}
