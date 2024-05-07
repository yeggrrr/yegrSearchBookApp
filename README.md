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
        - Kakao Developers **검색 제품**의 **** `책 검색 기능`을 사용
            - https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-book
         
## LV3 - 책 상세 보기 & 담기 기능 구현

- 





