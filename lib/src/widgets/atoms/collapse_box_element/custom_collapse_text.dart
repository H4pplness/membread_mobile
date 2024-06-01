
import 'package:flutter/material.dart';


class CustomCollapseContent extends StatefulWidget {
  Widget child;
  AnimationController? controller;
  CustomCollapseContent({super.key,this.controller,required this.child});

  @override
  State<CustomCollapseContent> createState() => _CustomCollapseContentState();
}

class _CustomCollapseContentState extends State<CustomCollapseContent> {
  late Animation<double> _resizeAnimation;
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller!;
    _resizeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _resizeAnimation,
      axis: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            SizedBox(height: 1,child: Container(color: Theme.of(context).dividerColor,),),
            const SizedBox(height: 5,),
            widget.child,
          ]
      ),
    );
  }
}
