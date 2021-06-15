final String tableName = 'tripinfo_database';

class TripinfoFields {
  static final List<String> values = [
    travelId,
    name,
    destinantionId,
    startDate,
    endDate
  ];

  static final String travelId = 'travelId';
  static final String name = 'name';
  static final String destinantionId = 'destinationId';
  static final String startDate = 'startDate';
  static final String endDate = 'endDate';
}

//TODO: DODAC POLE NA SCIEZKE DO ZDJECIA

class Tripinfo {
  int? travelId;
  String name;
  String destinationId;
  DateTime startDate;
  DateTime endDate;

  Tripinfo(
      {this.travelId,
      required this.name,
      required this.destinationId,
      required this.startDate,
      required this.endDate});

  static Tripinfo fromJson(Map<String, dynamic> json) => Tripinfo(
      travelId: json[TripinfoFields.travelId] as int?,
      name: json[TripinfoFields.name] as String,
      destinationId: json[TripinfoFields.destinantionId] as String,
      startDate: DateTime.parse(json[TripinfoFields.startDate] as String),
      endDate: DateTime.parse(json[TripinfoFields.endDate] as String));

  Map<String, Object?> toJson() => {
        TripinfoFields.travelId: travelId,
        TripinfoFields.name: name,
        TripinfoFields.destinantionId: destinationId,
        TripinfoFields.startDate: startDate.toIso8601String(),
        TripinfoFields.endDate: endDate.toIso8601String()
      };

  Tripinfo copy({
    int? travelId,
    String? name,
    String? destinationId,
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      Tripinfo(
          travelId: travelId ?? this.travelId,
          name: name ?? this.name,
          destinationId: destinationId ?? this.destinationId,
          startDate: startDate ?? this.startDate,
          endDate: endDate ?? this.endDate);

  @override
  String toString() {
    return super.toString();
  }
}
