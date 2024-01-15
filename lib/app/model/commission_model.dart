class CommissionModel {
  final String location;
  final String target;
  final String name;
  final double progress;
  final String completed;

  CommissionModel(
      {required this.location,
      required this.target,
      required this.name,
      required this.progress,
      required this.completed});
}
