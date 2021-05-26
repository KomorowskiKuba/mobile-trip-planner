final String tableName = 'notes_database';

class NoteFields {
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

  Map<String, dynamic> toJson() => {
    NoteFields.noteId: noteId,
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