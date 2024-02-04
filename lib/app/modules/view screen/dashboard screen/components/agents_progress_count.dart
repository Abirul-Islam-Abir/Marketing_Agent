import '../../../../data/const/export.dart';

class AgentsProgressCount extends StatelessWidget {
  const AgentsProgressCount({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        data.length,
            (index) {
          final agentName = data[index]['agent_name'];
          final sellAmount = data[index]['sell_amount'];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kRedColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$agentName -'
                          ' ${sellAmount.toDouble()}%'
                          .toUpperCase(),
                      style:
                      const TextStyle(color: AppColor.kWhiteColor, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}