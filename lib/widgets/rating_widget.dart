import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/const_path.dart';

class RatingWidget extends ConsumerStatefulWidget {
  const RatingWidget(
      {super.key, required this.currentRating, required this.pId});
  final String pId;
  final double currentRating;

  @override
  ConsumerState<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends ConsumerState<RatingWidget> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    final rating = ref.watch(orderProvider);
    return RatingStars(
      value: value,
      onValueChanged: (v) async {
        //
        setState(() {
          value = v;
        });

        await rating.updateRating(
            pId: widget.pId,
            currentRating: widget.currentRating,
            rating: value);
      },
      starBuilder: (index, color) => Icon(
        Icons.star_border_outlined,
        color: color,
      ),
      starCount: 5,
      starSize: 20,
      valueLabelColor: const Color(0xff9b9b9b),
      valueLabelTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
      valueLabelRadius: 10,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: true,
      valueLabelVisibility: true,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
