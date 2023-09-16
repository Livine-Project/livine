import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../constants/constants.dart';

class ErrorCustomWidget extends StatelessWidget {
  const ErrorCustomWidget({
    Key? key,
    required PagingController pagingController,
  })  : _pagingController = pagingController,
        super(key: key);

  final PagingController _pagingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          'assets/images/network/not_found.svg',
          width: rh.deviceWidth(context) * 0.7,
        ),
        SizedBox(height: rh.deviceHeight(context) * 0.05),
        Text("Something went wrong",
            style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: rh.deviceHeight(context) * 0.05),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () => _pagingController.refresh(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child: Text(
                "Try again",
                style: TextStyle(fontFamily: 'Kine'),
              ),
            ))
      ],
    );
  }
}
