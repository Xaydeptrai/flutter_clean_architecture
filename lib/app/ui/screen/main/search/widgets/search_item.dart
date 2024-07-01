import 'package:flutter/material.dart';
import 'package:imdb/domain/entities/movie_data.dart';
import 'package:imdb/library/resource/colors.dart';
import 'package:imdb/library/resource/typography.dart';

class SearchItem extends StatelessWidget {
  const SearchItem ({
    required this.movieData,
    required this.index,
    super.key
  });

  final MovieData movieData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movieData.title,
                    style: AppTypography.bigText,
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
                        movieData.rating.toStringAsFixed(1),
                        style: AppTypography.text,
                      )
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    movieData.releaseDate,
                    maxLines: 2,
                    softWrap: true,
                    style: AppTypography.text,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
