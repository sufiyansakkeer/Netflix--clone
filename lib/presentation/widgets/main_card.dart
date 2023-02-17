import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg"))),
    );
  }
}
