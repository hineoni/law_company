import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Импортируем для форматирования даты
import '../api/api_client.dart';

class ProvidedServicesScreen extends StatelessWidget {
  final ApiClient api;
  const ProvidedServicesScreen({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оказанные услуги')),
      body: FutureBuilder<List<dynamic>>(
        future: api.getProvidedServices(),
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
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: row.entries.map<Widget>((e) {
                    // Проверяем, если это дата — форматируем
                    String displayValue;
                    if (e.key == 'Дата оказания' && e.value != null) {
                      final date = DateTime.parse(e.value.toString());
                      displayValue = DateFormat('yyyy-MM-dd').format(date);
                    } else {
                      displayValue = e.value?.toString() ?? '';
                    }

                    return ListTile(
                      title: Text(e.key.toString()),
                      subtitle: Text(displayValue),
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
