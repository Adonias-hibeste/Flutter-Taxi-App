class VehicleCategory {
  final String id;
  final String name;
  final String description;
  final double baseFare;
  final String iconPath;
  final int estimatedArrivalMins;

  VehicleCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.baseFare,
    required this.iconPath,
    required this.estimatedArrivalMins,
  });
}
