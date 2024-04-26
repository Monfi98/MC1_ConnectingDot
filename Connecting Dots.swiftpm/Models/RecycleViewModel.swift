import SwiftUI


struct RecycleViewModel: Identifiable {
    var id: Int
    
    var title: String
    var subTitle: String?
    var isReversed: Bool?
    var placeholder: String?
    var view: (any View)?
    
    static var pages: [RecycleViewModel] = [
        RecycleViewModel(id: 1, title: "이름이 어떻게 되시나요?", subTitle: "개인정보는 따로 온라인에 저장하지 않아요", placeholder: "내 이름"),
        RecycleViewModel(id: 2, title: "Light/Dark 테마 중\n어떤것이 더 편안한가요?", subTitle: "반가워요 신승재님!", isReversed: true),
        RecycleViewModel(id: 3, title: "오늘 당신에게 필요한 것은?", subTitle: "이어폰을 착용하고 골라주세요."),
        RecycleViewModel(id: 4, title: "내 인생에 있어서 가장\n신났던 일 한가지를 적어주세요!", subTitle: "명사형로 끝나도록 적어주세요", placeholder: "얼마전에 갔다온 미국여행"),
        RecycleViewModel(id: 5, title: "위 문장을 참고해서 떠오르는 경험에 기반한 키워드를 써주세요", subTitle: "우와 애플아카데미 합격!", isReversed: true, placeholder: "8글자 이내로 써주세요."),
        RecycleViewModel(id: 6, title: "내 인생에 있어서 가장\n슬펐던 일 한가지를 적어주세요!", subTitle: "명사형로 끝나도록 적어주세요", placeholder: "애플 아카데미 불합격"),
        RecycleViewModel(id: 7, title: "위 문장을 참고해서 떠오르는 경험에 기반한 키워드를 써주세요", subTitle: "우와 애플아카데미 합격!",isReversed: true, placeholder: "8글자 이내로 써주세요."),
        RecycleViewModel(id: 8, title: "내 인생에 있어서 전환점이\n되었던 일 한가지를 적어주세요!", subTitle: "명사형로 끝나도록 적어주세요", placeholder: "tech 세션때 Yenni의 가르침"),
        RecycleViewModel(id: 9, title: "위 문장을 참고해서 떠오르는 경험에 기반한 키워드를 써주세요", subTitle: "우와 애플아카데미 합격!", isReversed: true, placeholder: "8글자 이내로 써주세요."),
        RecycleViewModel(id: 10, title: "현재 있는 장소는 어디인가요?", subTitle: "ex) 우리집 침대위, 내가 제일 좋아하는 카페", placeholder: "C5 건물 5층"),
        RecycleViewModel(id: 11, title: "방금 적어봤던 경험들의\n대표격인 문장을 적어주세요.", subTitle: "이제 거의 다왔어요!", placeholder: "나의 첫 Connecting Dots"),
        RecycleViewModel(id: 12, title: "아래 세점의 순서를 배치해주세요"),
        RecycleViewModel(id: 13, title: "Connectig Dot을 통해\n하나의 Jouney를\n완성했어요!"),
        RecycleViewModel(id: 14, title: "Journey안에서\n각각의 Dot별로\n메모도 할 수 있어요!"),
    ]
}

