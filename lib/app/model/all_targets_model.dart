class AllTargetsModel {
  String? title;
  int? agentsCount;
  String? targetAmount;
  String? amountCollected;

  AllTargetsModel(
      {this.title, this.agentsCount, this.targetAmount, this.amountCollected});

  AllTargetsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    agentsCount = json['agents_count'];
    targetAmount = json['target_amount'];
    amountCollected = json['amount_collected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['agents_count'] = agentsCount;
    data['target_amount'] = targetAmount;
    data['amount_collected'] = amountCollected;
    return data;
  }
}
