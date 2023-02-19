import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search_screen/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search_screen/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchBloc>(context).add(Initialized());
      },
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CupertinoSearchTextField(
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: kGreyColor,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: kGreyColor,
              ),
              style: TextStyle(color: Colors.white),
            ),
            kHeight,
            Expanded(
              child: SearchIdleWidget(),
            ),
            // Expanded(
            //   child: SearchResultWidget(),
            // ),
          ],
        )),
      ),
    );
  }
}
