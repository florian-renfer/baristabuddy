// This class represents attributes of informational content.
class InformationalContent {
  final String title;
  final String description;

  const InformationalContent({required this.title, required this.description});
}

const List<InformationalContent> informationalContents = <InformationalContent>[
  InformationalContent(title: 'Coffee dose', description: ''),
  InformationalContent(title: 'Grind size', description: ''),
  InformationalContent(title: 'Brewing', description: ''),
  InformationalContent(title: 'Temparature', description: ''),
  InformationalContent(title: 'Water', description: ''),
];
