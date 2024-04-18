class DropdownObject {
  DropdownObject({
    required this.key,
    required this.value,
  });

  factory DropdownObject.fromJson(Map<String, dynamic> json) => DropdownObject(
        key: json['key'] as String,
        value: json['value'] as String,
      );

  String key;
  String value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'value': value,
      };

  @override
  String toString() => 'DropdownObject(key: $key, value: $value)';
}
