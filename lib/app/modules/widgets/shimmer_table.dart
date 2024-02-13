import 'package:data_table_2/data_table_2.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/const/export.dart';

class ShimmerTable extends StatelessWidget {
  const ShimmerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.kGreyColor,
        highlightColor: AppColor.kShimmerWhite,
        child: SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.kWhiteColor.withOpacity(0.20),
              ),
              child:
              DataTable2(columnSpacing: 10, horizontalMargin: 10, columns: const [
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Name',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Progress',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ], rows: const [
                DataRow(cells: [
                  DataCell(
                    Text(""),
                  ),
                  DataCell(
                    Text(""),
                  ),
                ])
              ]),
            ),
          ),
        ));
  }
}