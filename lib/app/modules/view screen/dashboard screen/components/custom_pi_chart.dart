
import 'package:pie_chart/pie_chart.dart';

import '../../../../data/const/export.dart';

class CustomPiChart extends StatelessWidget {
  const CustomPiChart({
    super.key, required this.title, required this.dataMap,
  });
  final String title;
  final Map<String,double> dataMap;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 70,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const [
        AppColor.kRedColor,
        AppColor.kOrangeColor,
        AppColor.kGreenColor,
        AppColor.kYellowColor
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 50 ,
      centerText: title,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.left,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.kWhiteColor),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
        decimalPlaces: 1,
      ),
    );
  }
}