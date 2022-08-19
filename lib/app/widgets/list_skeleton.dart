import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'base_shimmer.dart';
import 'custom_animated_widgets.dart';

class ListSkeleton extends StatelessWidget {
  final int? length;
  const ListSkeleton({Key? key, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemSkeleton();
  }

  Widget _buildItemSkeleton() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(length ?? 15, (_) => 1).mapIndexed((index, element) {
          return CustomAnimatedWidgets().fadeSlideIn(
            position: index,
            delayInMillisecond: 50,
            durationInMillisecond: 150,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40 / 2)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40 / 2),
                        child: const BaseShimmer(
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          BaseShimmer(
                            width: 300,
                            height: 20,
                          ),
                          SizedBox(height: 8),
                          BaseShimmer(
                            width: 300,
                            height: 20,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ListSkeletonOneLine extends StatelessWidget {
  final int? length;
  const ListSkeletonOneLine({Key? key, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItemSkeleton(context);
  }

  Widget _buildItemSkeleton(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(length ?? 15, (_) => 1).mapIndexed((index, element) {
          return CustomAnimatedWidgets().fadeSlideIn(
            position: index,
            delayInMillisecond: 50,
            durationInMillisecond: 150,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: BaseShimmer(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}