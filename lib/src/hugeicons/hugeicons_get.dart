part of '../../easy_icon_pack.dart';

class HugeiconsGet {
  static final Map<String, IconData> iconMap = _hugeiconsMap;

  static List<String> get values => _hugeiconsMap.keys.toList();

  static IconData get(String name) => _hugeiconsMap[name]!;
}
