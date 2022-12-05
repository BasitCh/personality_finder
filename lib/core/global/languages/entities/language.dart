class LanguageEntity {
  final String code;
  final String? value;

  const LanguageEntity({
     required this.code,
     this.value,
  });
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'US'),
    LanguageEntity(code: 'fr', value: 'FR'),
    LanguageEntity(code: 'es', value: 'ES'),
    LanguageEntity(code: 'th', value: 'TH'),
  ];
}