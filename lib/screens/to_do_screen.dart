
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/to_do%20_model.dart';
import 'package:food_app/provider/to_do_provider.dart';
import 'package:food_app/style.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}




class _TodoScreenState extends ConsumerState<TodoScreen> {
final todoTextController = TextEditingController();
  @override
  void dispose() {
    todoTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Todo> todoProvider = ref.watch(todoNotifierprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("ToDo App"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: todoProvider.length,
        itemBuilder:(context, index) {
        return ListTile(
          title: Text(todoProvider[index].title,style: kTextStyle,),
          leading: Checkbox(value: todoProvider[index].completed, onChanged:(value) {
            
          },),
          trailing: IconButton(onPressed:() {
            ref.read(todoNotifierprovider.notifier).removeTodo(index);
          }, icon: Icon(Icons.delete,color: Colors.black,)),
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed:() {
        showDialog(context: context, builder:(context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Text("Todo App"),
            content: TextField(
                     controller: todoTextController,
                    decoration:  InputDecoration(
                      labelText: "Enter To Do"
                    ),

            ),
            actions: [TextButton(onPressed: () {
              final todo = Todo(title: todoTextController.text, completed: false);
              ref.read(todoNotifierprovider.notifier).addTodo(todo);
              Navigator.pop(context);
            }, child: Text("Add"))],
          );
        },);
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      ),
    );
  }
}