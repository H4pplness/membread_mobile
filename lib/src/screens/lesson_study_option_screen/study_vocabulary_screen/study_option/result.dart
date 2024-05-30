import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultOption extends ConsumerWidget {
  const ResultOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height-120,
      child: Center(
        child: Text("SUCCESS"),
      ),
    );
  }
}
