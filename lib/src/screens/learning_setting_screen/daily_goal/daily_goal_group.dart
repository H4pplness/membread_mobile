import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/repositories/score_repository/get_goal/get_goal.dart';

import '../../../widgets/atoms/buttons/border_button.dart';

class DailyGoalGroup extends ConsumerWidget {
  DailyGoalGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(getGoalProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Daily goal",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            BorderButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: goal == 10000 ? Theme.of(context).primaryColor : Colors.blue[200],
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              color: goal == 20000 ? Theme.of(context).primaryColor : Colors.blue[200],
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              color: goal == 50000 ? Theme.of(context).primaryColor : Colors.blue[200],
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
              color: goal == 100000 ? Theme.of(context).primaryColor : Colors.blue[200],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              color: goal == 200000 ? Theme.of(context).primaryColor : Colors.blue[200],
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
        )
      ],
    );
  }
}
