

import 'package:caphore/features/attributes/domain/entities/terms.dart';

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

}