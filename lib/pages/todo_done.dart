import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/riverpod/todo_done_states.dart';

class TodoDone extends ConsumerWidget {
  const TodoDone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoNotifierPrv = ref.watch(doneTodoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tamamlananlar"),
        centerTitle: true,
      ),
      body: todoNotifierPrv.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final todo = data[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(todo.text),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Gösterilecek veri bulunamadı!'),
            );
          }
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
