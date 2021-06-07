final String tableName = 'checklist_database';

class ChecklistItemFields {
  static final List<String> values = [travelId, itemId, itemName, checked];

  static final String travelId = 'travelId';
  static final String itemId = 'itemId';
  static final String itemName = 'itemName';
  static final String checked = 'checked';
}

class ChecklistItem {
  final int travelId;
  final int? itemId;
  String itemName;
  int checked;

  ChecklistItem(
      {required this.travelId,
      this.itemId,
      required this.itemName,
      required this.checked});

  static ChecklistItem fromJson(Map<String, dynamic> json) => ChecklistItem(
      travelId: json[ChecklistItemFields.travelId] as int,
      itemId: json[ChecklistItemFields.itemId] as int?,
      itemName: json[ChecklistItemFields.itemName] as String,
      checked: json[ChecklistItemFields.checked] as int);

  Map<String, Object?> toJson() => {
        ChecklistItemFields.itemId: itemId,
        ChecklistItemFields.travelId: travelId,
        ChecklistItemFields.itemName: itemName,
        ChecklistItemFields.checked: checked
      };

  ChecklistItem copy(
          {int? itemId, int? travelId, String? itemName, int? checked}) =>
      ChecklistItem(
          itemId: itemId ?? this.itemId,
          travelId: travelId ?? this.travelId,
          itemName: itemName ?? this.itemName,
          checked: checked ?? this.checked);
}
