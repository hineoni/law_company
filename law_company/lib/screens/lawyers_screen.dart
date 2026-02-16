import 'package:flutter/material.dart';
import '../api/api_client.dart';

class LawyersScreen extends StatelessWidget {
  final ApiClient api;
  const LawyersScreen({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Юристы')),
      body: FutureBuilder<List<dynamic>>(
        future: api.getLawyers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Ошибка загрузки данных'),
            );
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(child: Text('Нет данных'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final row = data[index] as Map<String, dynamic>;
              return Card(
                child: Column(
                  children: row.entries.map<Widget>((e) {
                    return ListTile(
                      title: Text(e.key.toString()),
                      subtitle: Text(e.value?.toString() ?? ''),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
