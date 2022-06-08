import 'package:flutter/material.dart';
import 'package:kanban_app/model/checklist.dart';
import 'package:kanban_app/model/to_do.dart';

class KabanPage extends StatelessWidget {
  const KabanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kanban",
        ),
      ),
      body: PageView(
        children: [
          ToDo(),
          InProgress(),
          Card(
            child: Text("osai"),
          )
        ],
      ),
    );
  }
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toDos = [
      ToDoModel(title: "Carro", date: DateTime.now()),
      ToDoModel(
        title: "Leva",
        comments: ["sdafsfa", "dasda", "fsafsa", "fasfsa"],
        task: [
          Checklist(title: "lavar prato", status: true),
          Checklist(title: "lavar casa", status: true),
          Checklist(title: "Arrumar garagem", status: true),
          Checklist(title: "Arrumar trabalho", status: false),
        ],
      )
    ];
    DateFormat()
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Para fazer",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: constraints.maxHeight * 0.9,
                    child: ListView.builder(
                      itemCount: toDos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              toDos[index].title ?? "",
                              style: TextStyle(fontSize: 22),
                            ),
                            trailing: Text(toDos[index].date?.toString() ?? ""),
                            subtitle: Row(
                              children: [
                                Icon(Icons.checklist),
                                Text(
                                    "${toDos[index].task?.where((element) => element.status == true).length ?? 0}/${toDos[index].task?.length ?? 0}"),
                                SizedBox(width: 15),
                                Icon(Icons.forum),
                                Text(toDos[index].comments?.length.toString() ??
                                    "0"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class InProgress extends StatelessWidget {
  const InProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
