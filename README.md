# Easy Icon Pack

Flutter 앱에서 **HugeIcons**와 **Lucide Icons**를 쉽게 사용할 수 있는 통합 아이콘 패키지입니다.

## 📦 포함된 아이콘 라이브러리

- [**HugeIcons**](https://hugeicons.com/icons): 4,400개 이상의 stroke-rounded 스타일 아이콘
- [**Lucide Icons**](https://lucide.dev/icons): 1,600개 이상의 아이콘

## 🚀 설치

`pubspec.yaml` 파일에 다음을 추가하세요:

**pub.dev**
```yaml
dependencies:
  easy_icon_pack: ^1.0.0
```

**github**
```yaml
dependencies:
  easy_icon_pack:
    git:
      url: https://github.com/scadasystems/easy_icon_pack.git
```

그리고 패키지를 가져오세요:

```bash
flutter pub get
```

## 📖 사용법

### 기본 import

```dart
import 'package:easy_icon_pack/easy_icon_pack.dart';
```

### Lucide Icons

```dart
Icon(LucideIcons.home)
```

### HugeIcons

```dart
Icon(HugeIcons.home)
```

## 📊 아이콘 통계

| 라이브러리 | 아이콘 개수 | 스타일 | 특징 |
|-----------|-----------|--------|------|
| HugeIcons | 4,400개+ | Stroke Rounded | 일관된 둥근 라인 스타일 |
| Lucide Icons | 1,600개+ | Minimalist | 깔끔하고 모던한 디자인 |


## ⚠️ 주의사항

1. **아이콘 이름 확인**: 사용하려는 아이콘 이름이 해당 라이브러리에 존재하는지 `values` 리스트로 확인하세요.
2. **성능 고려**: 대량의 아이콘을 한 번에 렌더링할 때는 페이지네이션을 고려하세요.
3. **예외 처리**: 존재하지 않는 아이콘 이름을 사용할 경우 예외가 발생할 수 있습니다.

## 🤝 기여하기

버그 리포트나 기능 제안은 [Issues](https://github.com/scadasystems/easy_icon_pack/issues) 페이지에서 환영합니다.

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 🔗 관련 링크

- [HugeIcons 공식 사이트](https://hugeicons.com/)
- [Lucide Icons 공식 사이트](https://lucide.dev/)

---

**Easy Icon Pack**으로 Flutter 앱에 아름다운 아이콘을 쉽게 추가하세요! 🎉
