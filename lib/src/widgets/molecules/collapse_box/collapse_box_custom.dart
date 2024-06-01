import 'package:flutter/material.dart';
import 'package:membreadflutter/src/widgets/atoms/collapse_box_element/custom_collapse_text.dart';
import '../../atoms/buttons/expanded_button.dart';


class CollapseBoxCustom extends StatefulWidget {
  Widget title;
  Widget child;
  Color? color;
  BoxDecoration? decoration;
  CollapseBoxCustom({super.key,required this.title,required this.child,this.color,this.decoration});

  @override
  State<CollapseBoxCustom> createState() => _CollapseBoxCustomState();
}

class _CollapseBoxCustomState extends State<CollapseBoxCustom> with TickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 10, bottom: 10, left: 20, right: 10),
      decoration: widget.decoration?? BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color??const Color.fromRGBO(32, 34, 41, 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title,
              GestureDetector(
                onTap: () {
                  _controller.isCompleted
                      ? _controller.reverse()
                      : _controller.forward();
                },
                child: ExpandedButton(
                  controller: _controller,
                ),
              ),
            ],
          ),
          CustomCollapseContent(controller: _controller,child: widget.child,)
        ],
      ),
    );
  }
}
