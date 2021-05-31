final String tableName = 'notes_database';

class NoteFields {
  static final List<String> values = [
    travelId, noteId, title, content
  ];

  static final String travelId = 'travelId';
  static final String noteId = 'noteId';
  static final String title = 'title';
  static final String content = 'content';
}


class Note {
  final int travelId;
  final int? noteId;
  final String title;
  final String content;

  const Note({required this.travelId, this.noteId, required this.title, required this.content});

  static Note fromJson(Map<String, dynamic> json) => Note(
    noteId: json[NoteFields.noteId] as int?,
    travelId: json[NoteFields.travelId] as int,
    title: json[NoteFields.travelId] as String,
    content: json[NoteFields.content] as String,
  );

  Map<String, Object?> toJson() => {
    NoteFields.noteId: noteId,
    NoteFields.travelId: travelId,
    NoteFields.title: title,
    NoteFields.content: content
  };

  Note copy({
    int? noteId,
    int? travelId,
    String? title,
    String? content,
  }) => Note(
    noteId: noteId ?? this.noteId,
    travelId: travelId ?? this.travelId,
    title: title ?? this.title,
    content: content ?? this.content
  );

}