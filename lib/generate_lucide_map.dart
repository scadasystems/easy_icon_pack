import 'dart:io';

void main() {
  // 1. 시스템의 pub-cache 경로 확인
  final env = Platform.environment;
  final pubCache =
      env['PUB_CACHE'] ?? (Platform.isWindows ? '${env['LOCALAPPDATA']}\\Pub\\Cache' : '${env['HOME']}/.pub-cache');

  // 2. 다운로드 된 lucide_icons_flutter-3.1.12 패키지 경로 지정
  final packageDir = Directory('$pubCache/hosted/pub.dev/lucide_icons_flutter-3.1.12');
  final iconFile = File('${packageDir.path}/lib/lucide_icons.dart');

  if (!iconFile.existsSync()) {
    print('lucide_icons_flutter 소스 파일을 찾을 수 없습니다.');
    print('경로를 확인하거나 flutter pub get을 먼저 실행해주세요.');
    return;
  }

  // 3. 소스 코드에서 아이콘 이름 파싱 (static const IconData 아이콘이름 = ...)
  final content = iconFile.readAsStringSync();
  final regex = RegExp(r'static const IconData (\w+) =');
  final matches = regex.allMatches(content);

  // 4. 새로운 icon_map.dart 내용 구성
  final buffer = StringBuffer();
  buffer.writeln("part of '../../easy_icon_pack.dart';\n");
  buffer.writeln('final Map<String, IconData> _lucideIconsMap = {');

  for (final match in matches) {
    final iconName = match.group(1);
    if (iconName != null) {
      buffer.writeln("  '$iconName': LucideIcons.$iconName,");
    }
  }

  buffer.writeln('};');

  // 5. lib/src/lucide/icon_map.dart 파일 덮어쓰기
  final outputFile = File('lib/src/lucide/icon_map.dart');
  outputFile.writeAsStringSync(buffer.toString());

  print('성공적으로 업데이트 되었습니다! (총 ${matches.length}개의 아이콘 매핑 완료)');
}
