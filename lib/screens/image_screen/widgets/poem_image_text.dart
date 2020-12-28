import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/text_providers.dart';

class PoemImageText extends ConsumerWidget {
  const PoemImageText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _scale = watch(textSizeProvider).state;
    final color = watch(textColorProvider).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Title",
          textAlign: TextAlign.center,
          textScaleFactor: _scale,
          style: TextStyle(
            fontSize: 30,
            color: color,
          ),
        ),
        Text(
          "${"Poem" * 18}\n" * 10,
          textScaleFactor: _scale,
          style: TextStyle(
            fontSize: 15,
            color: color,
          ),
        ),
        Text(
          "~Poet",
          textAlign: TextAlign.end,
          textScaleFactor: _scale,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
      ],
    );
  }
}
