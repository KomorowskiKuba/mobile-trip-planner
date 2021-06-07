final String tableName = 'reservations_database';

class ReservationFields {
  static final List<String> values = ['xd', 'xd'];

  static final String travelId = 'travelId';
  static final String reservationId = 'reservationId';
  static final String title = 'title';
  static final String imagePath = 'imagePath';
}

class Reservation {
  final int travelId;
  final int? reservationId;
  String title;
  String imagePath;

  Reservation(
      {required this.travelId,
      this.reservationId,
      required this.title,
      required this.imagePath});

  static Reservation fromJson(Map<String, dynamic> json) => Reservation(
      travelId: json[ReservationFields.travelId] as int,
      reservationId: json[ReservationFields.reservationId] as int?,
      title: json[ReservationFields.title] as String,
      imagePath: json[ReservationFields.imagePath] as String);

  Map<String, Object?> toJson() => {
        ReservationFields.travelId: travelId,
        ReservationFields.reservationId: reservationId,
        ReservationFields.title: title,
        ReservationFields.imagePath: imagePath
      };

  Reservation copy({
    int? travelId,
    int? reservationId,
    String? title,
    String? imagePath,
  }) =>
      Reservation(
          travelId: travelId ?? this.travelId,
          reservationId: reservationId ?? this.reservationId,
          title: title ?? this.title,
          imagePath: imagePath ?? this.imagePath);
}
