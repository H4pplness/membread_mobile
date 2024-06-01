import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/atoms/buttons/border_button.dart';
import '../../../widgets/molecules/collapse_box/collapse_box_custom.dart';

class GrammarCollapseBox extends ConsumerWidget {
  const GrammarCollapseBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollapseBoxCustom(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blueGrey)),
          color: Colors.white,
          title: Text(
            "Grammar",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          child: Row(
            children: [
              BorderButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                color: Colors.blue[200],
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      "10k",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
              BorderButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                color: Colors.blue[200],
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      "20k",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
              BorderButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                color: Colors.blue[200],
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      "50k",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
              BorderButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      "100k",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                // color: Colors.blue[200],
              ),
              BorderButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                color: Colors.blue[200],
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      "200k",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );;
  }
}
