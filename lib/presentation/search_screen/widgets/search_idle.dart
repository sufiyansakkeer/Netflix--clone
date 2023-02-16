import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/search_screen/widgets/title_search.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(
          title: 'Top Search',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItemTile(),
            separatorBuilder: (context, index) => kHeight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * .35,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: CircleAvatar(
            radius: 25,
            child: Icon(
              CupertinoIcons.play_arrow_solid,
            ),
          ),
        )
      ],
    );
  }
}
