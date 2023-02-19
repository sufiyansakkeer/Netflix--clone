import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                imageUrl: posterPath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        // letterSpacing: -5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomButtonWidget(
                        title: 'Remind me',
                        icon: Icons.notifications_none_outlined,
                        onPressed: () {},
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        title: 'info',
                        icon: Icons.info_outline,
                        iconSize: 20,
                        textSize: 12,
                        onPressed: () {},
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              Text("coming on $day $month"),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  color: kGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
