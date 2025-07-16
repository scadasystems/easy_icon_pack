part of '../../easy_icon_pack.dart';

class LucideIconsGet {
  static final List<IconData> list = icons;
  static final Map<String, IconData> iconMap = _lucideIconsMap;

  static List<String> get values => _lucideIconsMap.keys.toList();

  static IconData get(String name) => _lucideIconsMap[name]!;
}
