import SwiftUI

struct JourneyList: View {
    // MARK: - @AppStorage and @State
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @EnvironmentObject var journeyStore: JourneyStore
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium // 예: Jan 1, 2020
            formatter.timeStyle = .none
            return formatter
    }()
    
    var groupedJourneys: [String: [(index: Int, journey: JourneyModel)]] {
        Dictionary(grouping: journeyStore.journeys.enumerated().map { $0 }) { _, journey in
            // 날짜를 "오늘", "한 달 전", "세 달 전" 등으로 포맷팅
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            let interval = Calendar.current.dateComponents([.day], from: journey.date, to: Date()).day!
            switch interval {
            case 0:
                return "오늘"
            case 1...30:
                return "한달 전"
            case 31...90:
                return "세달 전"
            case 91...180:
                return "반년 전"
            default:
                return "일년 전"
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(groupedJourneys.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)
                    .font(.headline)
                    .foregroundColor(isDarkMode ? ColorPalette.fontWhite : ColorPalette.fontBlack)
                
                ) {
                    ForEach(groupedJourneys[key] ?? [], id: \.journey.id) { index, journey in
                        NavigationLink(destination: JourneyDetailView(journey: journey, index: index)) {
                            VStack(alignment: .leading) {
                                Text(journey.title)
                                    .font(Font.system(size: 16))
                                HStack {
                                    Text(journey.location)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(dateFormatter.string(from: journey.date)) // 날짜 표시
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            // 삭제할 항목의 id 찾기
            let idToDelete = journeyStore.journeys[offset].id
            // id를 사용하여 journeyStore.journeys에서 해당 항목 찾아 삭제
            if let indexToDelete = journeyStore.journeys.firstIndex(where: { $0.id == idToDelete }) {
                journeyStore.journeys.remove(at: indexToDelete)
            }
        }
    }
}
