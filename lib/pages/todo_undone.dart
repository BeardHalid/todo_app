import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/mobx/TodoCheck.dart';
import 'package:todo_app/pages/riverpod/todo_done_states.dart';
import 'package:todo_app/pages/riverpod/todo_undone_states.dart';

class TodoUndone extends ConsumerWidget {
  TodoUndone({super.key});

  final cb = TodoCheck();

  final tfTodo = TextEditingController();

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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                          "Değişiklik yapmak istediğinizden emin misiniz?"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                        undoneTodoNotifierProvider
                                                            .notifier)
                                                    .updateTodo(
                                                        todo.id, "true");
                                                ref.invalidate(doneTodoNotifierProvider);
                                                Navigator.pop(context);
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
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (context) {
                return Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Görev Ekle"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: tfTodo,
                        decoration: InputDecoration(
                            hintText: 'Görev...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(undoneTodoNotifierProvider.notifier)
                                  .addTodo(tfTodo.text);
                              Navigator.pop(context);
                            },
                            child: const Text('Ekle')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Vazgeç')),
                      ],
                    )
                  ],
                );
              },
            );
          },
          label: const Text("Yeni Görev")),
    );
  }
}
