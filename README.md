# yegrSearchBookApp

## GOALS

1. 이번 과제에서 우리는 책을 검색하고 저장하는 앱을 구현
2. **앱의 모든 UI 는 코드를 기반으로** 구현
3. CoreData 와 HTTP 통신을 사용하여 앱의 기능을 구현
4. 간단한 MVVM 구조로 리팩토링 해보기
   
## LV1 - 화면 구성
<img width="1068" alt="Untitled (2)" src="https://github.com/yeggrrr/yegrSearchBookApp/assets/161591832/eec16173-d26e-434c-b41e-b621046b9ea7">
(위 이미지는 참고용이고, 자유롭게 구성하기)

레벨 1에서는 탭 바와 각 화면에 해당하는 VC 생성 및 화면 전환 연결만 구현

1. **2개의 탭 과 3개의 화면을 가진 앱**
    - `UITabBarController` 을 사용하여 2개의 탭을 구현
2. **책 검색 화면**
    - 첫 번째 탭에 위치합니다.
3. **책 상세 화면**
    - 사용자는 **검색 결과의 리스트 아이템을 ‘탭’하여** 책 상세 화면에 진입 가능
    - 책 상세 화면은 `모달 방식`으로 등장
4. **담은 책 리스트 화면**
    - 두번째 탭에 위치
    - 사용자는 책 상세 화면에서 `담기` 를 한 책 리스트를 저장한 책 리스트 화면에서 볼 수 있음  
  
## LV2 - 책 검색 화면 구현
<img width="319" alt="Untitled (3)" src="https://github.com/yeggrrr/yegrSearchBookApp/assets/161591832/ca792dca-e754-48de-8a23-3345aac44779">

1. **화면 구성**
    - 사용자는 서치바를 이용해서 책을 검색
        - UISearchBar, UITextField 등을 활용
    - 사용자는 검색 이후 검색 결과를 리스트를 통해 볼 수 있음
    - 검색 결과 리스트는 컬렉션뷰(혹은 테이블뷰)로 구현
        - FlowLayout 사용 가능
        - 컬렉션뷰을 사용하시는 경우 CompositionalLayout 을 활용 가능

1. **검색 기능**
    - 사용자는 서치바를 사용하여 책을 검색 가능
    - 검색(입력완료)를 누르면, 검색 결과 리스트에 책 목록이 등장
    - 검색에는 카카오 책 검색 REST API 이용
        - Kakao Developers **검색 제품**의 `책 검색 기능`을 사용
            - https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-book
         
## LV3 - 책 상세 보기 & 담기 기능 구현

### 책 상세 화면

<img width="320" alt="Untitled (4)" src="https://github.com/yeggrrr/yegrSearchBookApp/assets/161591832/c190eee1-7334-446e-8796-c060dff59508">

- 책 상세 화면에서는 검색 결과 응답 내용을 자세하게 보여줌
    - title
    - authors
    - contents
    - thumbnail
    - 등등 (자유롭게 추가하기)
    
- `담기` 버튼을 탭하면
    - 해당 책은 **담은 책 목록 화면**에서 볼 수 있음
    
- `X` 버튼을 탭 하면 모달은 닫힙니다.
    - X 와 담기 버튼의 너비 비율은 1:3~4 정도
- (선택 구현) 책 상세 화면은 컨텐츠 양에 따라 스크롤 가능
- (선택 구현) 담기 및 X 버튼은 플로팅 버튼
- (선택 구현) 모달이 닫힌 이후, 책 검색 화면에서 `[…]책 담기 완료!` 라는 알림창을 보여주기
    - Delegate 패턴을 활용

### 담은 책 목록 화면

<img width="319" alt="Untitled (5)" src="https://github.com/yeggrrr/yegrSearchBookApp/assets/161591832/688561b4-7b38-4b9b-92b9-fddfa7770d9d">

- **담은 책 목록 화면**은 두번째 탭에 위치
- 앱을 종료하고 다시 시작해도 담은 책 목록은 남아있도록 하기
- 전체 삭제 버튼을 누르면 담았던 모든 책이 지워지도록 구현
- 스와이프 등의 방식을 통하여 담은 책 개별삭제가 가능
- (선택 구현) 추가 버튼을 누르면 첫번째 탭을 보여주고, 서치바를 활성화시키기
    - UITabBarController
    - First Responder
 
## LV4 - 최근 본 책 기능 구현

- 사용자가 책 상세보기 화면까지 살펴본 책이 있을 경우, 검색결과 리스트의 최상단에 `최근 본 책` 을 보여주기
- 검색 결과 리스트는 이제 2개의 섹션을 사용
    - 첫번째 섹션에서는 최근 본 책을 보여주기
    - 두번째 섹션에서는 검색 결과를 보여주기
- 최근 본 책은 가장 최근 10개의 책을 보여주기
- 가장 최근에 본 책이 가장 최상단(가로스크롤 구현시 가장 왼쪽)에 위치
- **최근 본 책이 없다면 섹션을 노출하지 않도록 구현**
- 각 섹션의 셀 디자인 및 레이아웃은 취향에 맞게 구현
    - 가로스크롤 구현은 필수X
    - 위 가이드대로 구현하기 어렵다면, 검색 결과 리스트 아이템 셀을 그대로 사용
- (선택구현) 최근 본 책을 ‘탭’하면 책 상세화면이 등장하도록 구현

## LV5 - 무한 스크롤 기능 구현, MVVM 리팩토링

- 검색 결과 리스트에 무한 스크롤을 구현
- MVVM 패턴으로 프로젝트를 리팩토링하기

