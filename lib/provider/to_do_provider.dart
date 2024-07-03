import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/to_do%20_model.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo (Todo todo){
    state = [...state,todo];

  }

  void removeTodo (int index){
  state = state.where((element) => state.indexOf(element) != index).toList();
  }

  
  
}

final todoNotifierprovider = NotifierProvider<TodoNotifier,List<Todo>>(() => TodoNotifier(),);