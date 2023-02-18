import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

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
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
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
              const VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tall girl 2',
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: -5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
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
              const Text("coming on friday"),
              kHeight,
              const Text(
                "Tall girl 2",
                style: TextStyle(
                  fontSize: 20,
                  color: kGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                'Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailspin.',
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
