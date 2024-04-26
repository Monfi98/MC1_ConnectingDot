import SwiftUI


class JourneyStore: ObservableObject {
    @Published var journeys = JourneyModel.userJourney
}


struct Dot: Identifiable {
    let id = UUID()
    var title: String
    var keyword: String
    var contents: String
}

struct JourneyModel: Identifiable {
    let id = UUID()
    var title: String
    var location: String
    var date: Date
    var dots: [Dot]
    
    // MARK: - UserInputData

    static var userJourney: [JourneyModel] = []
    
    // MARK: - DummyData
    
//    static let firstJourney = [JourneyModel(
//        title: UserInputModelDummy.userInput[0], // "산책"
//        location: UserInputModelDummy.userInput[1], // "공원에서"
//        date: Date(), // 현재 날짜
//        dots: [
//            Dot(title: TitleKeywordsDummy.items[0].title, keyword: TitleKeywordsDummy.items[0].subTitle, contents: "해가 뜨는 것을 보며 하루를 시작합니다."),
//            Dot(title: TitleKeywordsDummy.items[1].title, keyword: TitleKeywordsDummy.items[1].subTitle, contents: "조용한 공원 벤치에서 커피를 마십니다."),
//            Dot(title: TitleKeywordsDummy.items[2].title, keyword: TitleKeywordsDummy.items[2].subTitle, contents: "햇살 좋은 날, 책 한 권으로 여유를 즐깁니다.")
//        ]
//    ), JourneyModel(
//        title: UserInputModelDummy.userInput[1], // "산책"
//        location: UserInputModelDummy.userInput[2], // "공원에서"
//        date: Date(), // 현재 날짜
//        dots: [
//            Dot(title: TitleKeywordsDummy.items[0].title, keyword: TitleKeywordsDummy.items[0].subTitle, contents: "해가 뜨는 것을 보며 하루를 시작합니다."),
//            Dot(title: TitleKeywordsDummy.items[1].title, keyword: TitleKeywordsDummy.items[1].subTitle, contents: "조용한 공원 벤치에서 커피를 마십니다."),
//            Dot(title: TitleKeywordsDummy.items[2].title, keyword: TitleKeywordsDummy.items[2].subTitle, contents: "햇살 좋은 날, 책 한 권으로 여유를 즐깁니다.")
//        ]
//    )]
}

struct UserInputModelDummy {
    static var userInput: [String] = ["산책", "공원에서", "휴식", "일출 감상", "평화로움", "커피 한 잔", "여유", "책 읽기", "집중"]
}

struct TitleKeywordsDummy {
    static var items: [DotsTitleKeywords] = [
        DotsTitleKeywords(title: "일출 감상", subTitle: "평화로움"),
        DotsTitleKeywords(title: "커피 한 잔", subTitle: "여유"),
        DotsTitleKeywords(title: "책 읽기", subTitle: "집중")
    ]
}
