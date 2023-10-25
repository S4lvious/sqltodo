import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String todo;
  final textEditingController = TextEditingController();
  final List<String> todos = [];

  void createTodo() {
    setState(() {
      final todo = textEditingController.text.trim();
      if (todo.isEmpty) {
        return;
      } else {
        todos.add(todo);
      }
    });
  }

  void deleteTodo(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(hintText: 'Enter a todo'),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: createTodo,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteTodo(index),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
