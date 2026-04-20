import 'dart:io';

void main() {
  // 1. 시스템의 pub-cache 경로 확인
  final env = Platform.environment;
  final pubCache =
      env['PUB_CACHE'] ?? (Platform.isWindows ? '${env['LOCALAPPDATA']}\\Pub\\Cache' : '${env['HOME']}/.pub-cache');

  // 2. 다운로드 된 hugeicons-1.1.6 패키지 경로 지정
  final packageDir = Directory('$pubCache/hosted/pub.dev/hugeicons-0.0.11');

  // hugeicons 패키지의 주요 아이콘 정의 파일 경로
  final iconFile = File('${packageDir.path}/lib/hugeicons.dart');

  if (!iconFile.existsSync()) {
    print('hugeicons 소스 파일을 찾을 수 없습니다.');
    print('경로를 확인하거나 flutter pub get을 먼저 실행해주세요.');
    return;
  }

  // 3. 소스 코드에서 strokeRounded 스타일의 아이콘 이름 파싱
  final content = iconFile.readAsStringSync();
  // 정규식: static const IconData strokeRoundedAbacus = ... 형태 탐색
  final regex = RegExp(r'static const IconData (strokeRounded([A-Z]\w*))');
  final matches = regex.allMatches(content);

  // 4. 새로운 icon_map.dart 내용 구성
  final buffer = StringBuffer();
  buffer.writeln("part of '../../easy_icon_pack.dart';\n");
  buffer.writeln('final Map<String, IconData> _hugeiconsMap = {');

  for (final match in matches) {
    final fullVarName = match.group(1); // 예: strokeRoundedAbacus
    final iconNamePart = match.group(2); // 예: Abacus

    if (fullVarName != null && iconNamePart != null) {
      // 기존 규칙처럼 앞부분(strokeRounded)을 떼고 첫 글자를 소문자로 변환
      // Abacus -> abacus, AccountSetting01 -> accountSetting01
      final keyName = iconNamePart[0].toLowerCase() + iconNamePart.substring(1);

      buffer.writeln("  '$keyName': HugeIcons.$fullVarName,");
    }
  }

  buffer.writeln('};');

  // 5. lib/src/hugeicons/icon_map.dart 파일 덮어쓰기
  final outputFile = File('lib/src/hugeicons/icon_map.dart');
  outputFile.writeAsStringSync(buffer.toString());

  print('성공적으로 업데이트 되었습니다! (총 ${matches.length}개의 아이콘 매핑 완료)');
}
