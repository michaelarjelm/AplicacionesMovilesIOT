import '../models/evaluation.dart';

// In-memory stub EvaluationService for running without Firestore.
class EvaluationService {
  final List<Evaluation> _store = [
    Evaluation(
        title: 'Proyecto IOT',
        notes: 'Entregar informe',
        dueDate: null,
        isDone: false),
    Evaluation(
        title: 'Laboratorio',
        notes: 'Mediciones',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        isDone: false),
  ];

  Future<List<Evaluation>> getEvaluations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List<Evaluation>.from(_store);
  }

  Future<void> addEvaluation(Evaluation evaluation) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _store.add(evaluation);
  }

  Future<void> updateEvaluation(
      Evaluation oldEvaluation, Evaluation newEvaluation) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _store.indexOf(oldEvaluation);
    if (index != -1) {
      _store[index] = newEvaluation;
    }
  }

  Future<void> deleteEvaluation(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _store.removeWhere((e) => e.title == id);
  }
}
