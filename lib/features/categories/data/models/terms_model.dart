

import 'package:caphore/features/categories/domain/entities/terms.dart';

class TermModel extends Term {
  const TermModel(
      {required super.id,
        required super.name,
        required super.description,
});

  factory TermModel.fromJson(Map<String, dynamic> json) => TermModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
  );
}