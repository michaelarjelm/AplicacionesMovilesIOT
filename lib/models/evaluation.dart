class Evaluation {
  final String title;
  final String? notes;
  final DateTime? dueDate;
  bool isDone;

  Evaluation({
    required this.title,
    this.notes,
    this.dueDate,
    this.isDone = false,
  });

  bool get isOverdue {
    if (dueDate == null || isDone) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  bool get isPending => !isDone && !isOverdue;
}
