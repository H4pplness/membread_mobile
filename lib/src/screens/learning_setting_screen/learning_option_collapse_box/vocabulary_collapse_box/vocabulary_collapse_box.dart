import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/atoms/buttons/border_button.dart';
import '../../../../widgets/molecules/collapse_box/collapse_box_custom.dart';

class VocabularyCollapseBox extends ConsumerWidget {
  const VocabularyCollapseBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CollapseBoxCustom(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueGrey)),
      color: Colors.white,
      title: Text(
        "Vocabulary",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Study",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
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
                      "5",
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
                      "10",
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
                      "15",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Review",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
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
                      "10",
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
                      "20",
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
                      "30",
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
                      "50",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                // color: Colors.blue[200],
              )
            ],
          ),
          Text(
            "Speed review",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
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
                      "20",
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
                      "50",
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
                      "100",
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
                      "200",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                // color: Colors.blue[200],
              ),
            ],
          ),
        ],
      )
    );
  }
}
