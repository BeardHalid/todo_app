import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/mobx/TodoCheck.dart';
import 'package:todo_app/pages/riverpod/todo_undone_states.dart';

class TodoUndone extends ConsumerWidget {
  TodoUndone({super.key});

  final cb = TodoCheck();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final undoneTodoPrv = ref.watch(undoneTodoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tamamlanmamışlar"),
        centerTitle: true,
      ),
      body: undoneTodoPrv.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final todo = data[index];
                return Card(
                  child: Row(
                    children: [
                      Text(todo.text),
                      Observer(
                        builder: (context) {
                          return Checkbox(
                            value: cb.checked,
                            onChanged: (value) {
                              cb.setValue(value!);
                              showModalBottomSheet(
                                context: context,
                                isDismissible: false,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                          "Değişiklik yapmak istediğinizden emin misiniz?"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                        undoneTodoNotifierProvider
                                                            .notifier)
                                                    .updateTodo(
                                                        todo.id, "true");
                                              },
                                              child: const Text("Evet")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                cb.setValue(false);
                                              },
                                              child: const Text("Hayır")),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Gösterilecek veri bulunamadı!"),
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
