import 'package:flutter/material.dart';
import '../api/api_client.dart';

class ClientsScreen extends StatelessWidget {
  final ApiClient api;
  const ClientsScreen({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Клиент')),
      body: FutureBuilder<List<dynamic>>(
        future: api.getClients(),
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

          final row = data.first;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: row.entries.map<Widget>((e) {
              return ListTile(
                title: Text(e.key.toString()),
                subtitle: Text(e.value?.toString() ?? ''),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
