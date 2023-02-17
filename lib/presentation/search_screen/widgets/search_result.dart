import 'package:flutter/material.dart';

import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/search_screen/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search_screen/widgets/title_search.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});
  static const imageUrl =
      "https://www.themoviedb.org/t/p/w1280/54VeaIGwNGsnztFjCOLCPL2rFto.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              20,
              (index) => const MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}

// class MainCard extends StatelessWidget {
//   const MainCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: const DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(imageUrl),
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
