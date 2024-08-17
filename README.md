# Clowing
- 창의아이디어 본선 앱

# 경민아 미안해 ㅈ댔어..
# 진짜 ㅈ댔어..

## 기능
1. 옷장
  - 카테고리(상의 하의 등)별 의상 확인 기능 (스크롤)
  - 옷 검색 (옷 이름을 통해 검색? 혹은 카테고리를 통해 검색? 모르겟음 카테고리가 더 나을것같음)
  - 옷 추가하기 -> 옷사진등록(카메라, 이미지) -> 글쓰기(입력해야하는것: 옷 이름, 색상, 소재(소재 택 인식 카메라)

2. 세탁기
  - ootd에서 따온 착용 이력을 기반으로 세탁 알림 제공
  - 상세페이지에서 옷 소재 별 빨래 가이드 제공

3. Ootd
  - 오늘 입을 옷 고르기 -> 옷이 리스트화됨(날짜 데이터 필요)

4. ai코디 추천
  - 사용자 지정 색상 + 사용자 선호도 기반 코디 추천(옷장에 있는 옷으로)

## 파일 구조
```
lib/
├── main.dart
└── screens/
    ├── mypage_screen.dart
    ├── closet/
    │   ├── closet_main.dart                     - 8월 3일 완성
    │   ├── clothes/
    │   │   ├── bag_screen.dart                  - 8월 5일 완성
    │   │   ├── fashion_screen.dart              - 8월 5일 완성
    │   │   ├── low_screen.dart                  - 8월 5일 완성
    │   │   ├── outer_screen.dart                - 8월 5일 완성
    │   │   ├── shoes_screen.dart                - 8월 5일 완성
    │   │   └── top_screen.dart                  - 8월 5일 완성
    │   ├── add/
    │   │   └── add_screen.dart                  - 8월 4일 완성
    │   └── fin/
    │       └── finish_screen.dart               - 8월 5일 완성
    ├── washing/
    │   ├── washing_main.dart                    - 8월 3일 완성
    │   ├── washing_screen.dart                  - 8월 6일 완성
    │   ├── washing_details_screen.dart          - 8월 6일 완성
    │   └── washing_completed_screen.dart        - 8월 6일 완성
    ├── ootd/
    │   ├── ootd_main.dart                       - 8월 3일 완성
    │   ├── choose_screen.dart
    │   ├── decision_screen.dart
    │   └── ootd_completion_screen.dart
    ├── ai/
    │   ├── ai_main.dart                         - 8월 3일 완성
    │   ├── ai_input_screen.dart
    │   ├── ai_running_screen.dart
    │   ├── ai_complete_screen.dart
    │   └── ai_storage_screen.dart
    ├── start/
    │   ├── login_main.dart                      - 8월 2일 완성
    │   ├── gender_screen.dart                   - 8월 2일 완성
    │   ├── age_screen.dart                      - 8월 2일 완성
    │   ├── height_screen.dart                   - 8월 2일 완성
    │   └── login_successful_screen.dart         - 8월 4일 완성
    └── splash/
        └── splash.dart                          - 8월 2일 완성
```

# tlqkf 진짜 잘 되자