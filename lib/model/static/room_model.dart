class RoomModel {
  final int id;
  final String name;
  final String type;
  final int capacity;
  final bool isActive;
  final bool isOccupied;
  final String status;

  RoomModel({
    required this.id,
    required this.name,
    required this.type,
    required this.capacity,
    required this.isActive,
    required this.isOccupied,
    required this.status,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      capacity: json['capacity'] ?? 0,
      isActive: (json['is_active'] ?? 0) == 1 || json['is_active'] == true,
      isOccupied:
          (json['is_occupied'] ?? 0) == 1 || json['is_occupied'] == true,
      status: json['status'] ?? '',
    );
  }
}
