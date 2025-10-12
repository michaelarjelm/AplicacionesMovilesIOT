import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../models/evaluation.dart';
import '../services/evaluation_service.dart';
import '../services/auth_service.dart';

class EvaluationsScreen extends StatefulWidget {
  const EvaluationsScreen({super.key});

  @override
  State<EvaluationsScreen> createState() => _EvaluationsScreenState();
}

class _EvaluationsScreenState extends State<EvaluationsScreen> {
  final EvaluationService _evaluationService = EvaluationService();
  final AuthService _authService = AuthService();
  List<Evaluation> _evaluations = [];

  @override
  void initState() {
    super.initState();
    _loadEvaluations();
  }

  Future<void> _loadEvaluations() async {
    try {
      final evaluations = await _evaluationService.getEvaluations();
      setState(() {
        _evaluations = evaluations;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar evaluaciones: $e')),
      );
    }
  }

  String _searchQuery = '';
  String _filter = 'todas';

  List<Evaluation> get _filteredEvaluations {
    return _evaluations.where((e) {
      final matchesSearch =
          e.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              (e.notes?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
                  false);

      switch (_filter) {
        case 'pendientes':
          return matchesSearch && e.isPending;
        case 'completas':
          return matchesSearch && e.isDone;
        default:
          return matchesSearch;
      }
    }).toList()
      ..sort((a, b) {
        if (a.dueDate == null) return 1;
        if (b.dueDate == null) return -1;
        return a.dueDate!.compareTo(b.dueDate!);
      });
  }

  void _showCreateDialog() {
    final titleController = TextEditingController();
    final notesController = TextEditingController();
    DateTime? selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nueva Evaluación',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Notas (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  selectedDate = date;
                }
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('Seleccionar fecha (opcional)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('El título es obligatorio')),
                  );
                  return;
                }
                setState(() {
                  _evaluations.add(Evaluation(
                    title: titleController.text,
                    notes: notesController.text.isEmpty
                        ? null
                        : notesController.text,
                    dueDate: selectedDate,
                  ));
                });
                Navigator.pop(context);
              },
              child: const Text('Crear'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluaciones'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text('Cerrar sesión',
                style: TextStyle(color: Colors.white)),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar cierre de sesión'),
                  content:
                      const Text('¿Estás seguro de que deseas cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await _authService.signOut();
                        if (!mounted) return;
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      child: const Text('Cerrar sesión'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar evaluaciones...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Todas'),
                  selected: _filter == 'todas',
                  onSelected: (selected) => setState(() => _filter = 'todas'),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Pendientes'),
                  selected: _filter == 'pendientes',
                  onSelected: (selected) =>
                      setState(() => _filter = 'pendientes'),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Completas'),
                  selected: _filter == 'completas',
                  onSelected: (selected) =>
                      setState(() => _filter = 'completas'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredEvaluations.length,
              itemBuilder: (context, index) {
                final evaluation = _filteredEvaluations[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            _evaluations.remove(evaluation);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Evaluación eliminada'),
                              action: SnackBarAction(
                                label: 'Deshacer',
                                onPressed: () {
                                  setState(() {
                                    _evaluations.add(evaluation);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Eliminar',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Tooltip(
                      message: evaluation.isDone
                          ? 'Marcar como pendiente'
                          : 'Marcar como completada',
                      child: Checkbox(
                        value: evaluation.isDone,
                        onChanged: (value) {
                          setState(() {
                            evaluation.isDone = value ?? false;
                          });
                        },
                      ),
                    ),
                    title: Text(
                      evaluation.title,
                      style: TextStyle(
                        decoration: evaluation.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (evaluation.notes != null) Text(evaluation.notes!),
                        if (evaluation.dueDate != null)
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(evaluation.dueDate!),
                            style: TextStyle(
                              color: evaluation.isOverdue ? Colors.red : null,
                            ),
                          ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (evaluation.isOverdue)
                          const Tooltip(
                            message: 'Evaluación vencida',
                            child: Icon(Icons.warning, color: Colors.orange),
                          ),
                        IconButton(
                          icon: Icon(Icons.edit,
                              color: Theme.of(context).colorScheme.primary),
                          tooltip: 'Editar evaluación',
                          onPressed: () {
                            final titleController =
                                TextEditingController(text: evaluation.title);
                            final notesController =
                                TextEditingController(text: evaluation.notes);
                            DateTime? selectedDate = evaluation.dueDate;

                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Editar Evaluación',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 16),
                                    TextField(
                                      controller: titleController,
                                      decoration: const InputDecoration(
                                        labelText: 'Título',
                                        border: OutlineInputBorder(),
                                      ),
                                      autofocus: true,
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: notesController,
                                      decoration: const InputDecoration(
                                        labelText: 'Notas (opcional)',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate:
                                              selectedDate ?? DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 365)),
                                        );
                                        if (date != null) {
                                          selectedDate = date;
                                        }
                                      },
                                      icon: const Icon(Icons.calendar_today),
                                      label: Text(selectedDate != null
                                          ? 'Cambiar fecha: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}'
                                          : 'Seleccionar fecha (opcional)'),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Cancelar'),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (titleController
                                                  .text.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'El título es obligatorio')),
                                                );
                                                return;
                                              }

                                              final newEvaluation = Evaluation(
                                                title: titleController.text,
                                                notes:
                                                    notesController.text.isEmpty
                                                        ? null
                                                        : notesController.text,
                                                dueDate: selectedDate,
                                                isDone: evaluation.isDone,
                                              );

                                              await _evaluationService
                                                  .updateEvaluation(evaluation,
                                                      newEvaluation);
                                              setState(() {
                                                final index = _evaluations
                                                    .indexOf(evaluation);
                                                if (index != -1) {
                                                  _evaluations[index] =
                                                      newEvaluation;
                                                }
                                              });

                                              if (!mounted) return;
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Evaluación actualizada')),
                                              );
                                            },
                                            child: const Text('Guardar'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              color: Theme.of(context).colorScheme.primary),
                          tooltip: 'Eliminar evaluación',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirmar eliminación'),
                                content: const Text(
                                    '¿Estás seguro de que deseas eliminar esta evaluación?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        _evaluations.remove(evaluation);
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                              'Evaluación eliminada'),
                                          action: SnackBarAction(
                                            label: 'Deshacer',
                                            onPressed: () {
                                              setState(() {
                                                _evaluations.add(evaluation);
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text('Eliminar',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        tooltip: 'Agregar nueva evaluación',
        child: const Icon(Icons.add),
      ),
    );
  }
}
