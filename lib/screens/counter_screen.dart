import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

  final count =  ref.watch(counterProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).state++;
      },
      child: Icon(Icons.add),
      
      ),
      body: Center(child: Text(count.toString()),),
      appBar: AppBar(actions: [IconButton(onPressed: (){
   ref.read(counterProvider.notifier).state= 0;
      }, icon: Icon(Icons.reset_tv))],),
    );
  }
}