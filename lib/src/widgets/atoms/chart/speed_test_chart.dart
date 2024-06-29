
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpeedTestChart extends StatefulWidget {
  final int trueAnswer;
  final int total;
  const SpeedTestChart({super.key,required this.trueAnswer,required this.total});

  @override
  State<SpeedTestChart> createState() => _SpeedTestChartState();
}

class _SpeedTestChartState extends State<SpeedTestChart> {
  late double truePercent;
  late double falsePercent;
  int touchedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    truePercent = widget.trueAnswer / widget.total * 100;
    falsePercent = (widget.total - widget.trueAnswer) / widget.total * 100;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    return [
      PieChartSectionData(
        color: Colors.red,
        value: falsePercent,
        title: '${falsePercent.round()}',
        radius: 60,
        titleStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: truePercent,
        title: '${truePercent.round()}',
        radius: 60,
        titleStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      ),
    ];
  }
}
