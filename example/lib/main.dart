import 'package:flutter/material.dart';
import 'package:livoforms/livoforms.dart';

/// ===============================
/// Task Model
/// ===============================
class Task extends ReactiveModel {
  String _title;
  bool _completed = false;
  String _status = "Idle";
  DateTime _dueDate = DateTime.now();
  double _progress = 0;
  String _priority = "Medium";

  Task({required String title}) : _title = title;

  String get title => _title;
  set title(String value) {
    if (_title != value) {
      _title = value;
      notifyListeners(#title);
    }
  }

  bool get completed => _completed;
  set completed(bool value) {
    if (_completed != value) {
      _completed = value;
      notifyListeners(#completed);
    }
  }

  String get status => _status;
  set status(String value) {
    if (_status != value) {
      _status = value;
      notifyListeners(#status);
    }
  }

  DateTime get dueDate => _dueDate;
  set dueDate(DateTime value) {
    if (_dueDate != value) {
      _dueDate = value;
      notifyListeners(#dueDate);
    }
  }

  double get progress => _progress;
  set progress(double value) {
    if (_progress != value) {
      _progress = value;
      notifyListeners(#progress);
    }
  }

  String get priority => _priority;
  set priority(String value) {
    if (_priority != value) {
      _priority = value;
      notifyListeners(#priority);
    }
  }

  // -----------------------
  // Required for livoforms
  // -----------------------
  Map<String, dynamic> toJson() {
    return {
      'title': _title,
      'completed': _completed,
      'status': _status,
      'dueDate': _dueDate,
      'progress': _progress,
      'priority': _priority,
    };
  }

  void fromJson(Map<String, dynamic> json) {
    if (json.containsKey('title')) _title = json['title'];
    if (json.containsKey('completed')) _completed = json['completed'];
    if (json.containsKey('status')) _status = json['status'];
    if (json.containsKey('dueDate')) _dueDate = json['dueDate'];
    if (json.containsKey('progress')) _progress = json['progress'];
    if (json.containsKey('priority')) _priority = json['priority'];
  }
}

/// ===============================
/// Example App
/// ===============================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reactive ORM Forms Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

/// ===============================
/// Home Page
/// ===============================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Task task = Task(title: "");

  final List<String> statuses = ["Idle", "In Progress", "Completed"];
  final List<String> priorities = ["Low", "Medium", "High"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reactive Livo Forms")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📝 Task Title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ReactiveTextField(
              model: task,
              fieldName: "title",
              hintText: "Enter task title",
            ),
            const SizedBox(height: 20),

            const Text(
              "✅ Completed",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ReactiveCheckbox(model: task, fieldName: "completed"),
            const SizedBox(height: 20),

            const Text(
              "📌 Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ReactiveSelectorF(
              model: task,
              fieldName: "status",
              items: statuses,
            ),
            const SizedBox(height: 20),

            const Text(
              "🗓 Due Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ReactiveDatePicker(model: task, fieldName: "dueDate"),
            const SizedBox(height: 20),

            const Text(
              "📊 Progress",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ReactiveSlider(
              model: task,
              fieldName: "progress",
              min: 0,
              max: 100,
            ),
            const SizedBox(height: 20),

            const Text(
              "⭐ Priority",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ReactiveSelectorF(
              model: task,
              fieldName: "priority",
              items: priorities,
            ),

            const Divider(height: 40, thickness: 2),

            const Text(
              "📌 Summary (Reactive Preview)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ReactiveBuilder<Task>(
              model: task,
              fields: [
                #title,
                #completed,
                #status,
                #dueDate,
                #progress,
                #priority,
              ],
              builder: (t) => Card(
                color: Colors.teal[50],
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title: ${t.title}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text("Completed: ${t.completed}"),
                      Text("Status: ${t.status}"),
                      Text(
                        "Due Date: ${t.dueDate.toLocal().toString().split(' ')[0]}",
                      ),
                      Text("Progress: ${t.progress.toStringAsFixed(1)}%"),
                      Text("Priority: ${t.priority}"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
