import SwiftUI

struct AddJourneyView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var journeyStore: JourneyStore
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    @State var titleText: String = ""
    @State var locationText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack() {
                VStack {
                    HStack{
                        Text("Journey의 타이틀을 정해주세요!")
                            .font(Font.system(size: 20).weight(.bold))
                        Spacer()
                    }
                    
                    TextField("Journey Title", text: $titleText)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                        .cornerRadius(10)
                        .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                    
                    HStack {
                        Text("작성하고 있는 장소는 어디인가요?")
                            .font(Font.system(size: 20).weight(.bold))
                        Spacer()
                    }.padding(.top, 20)
                    TextField("Location", text: $locationText)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                        .cornerRadius(10)
                        .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                    
                    CustomButton(text: "추가", action: {
                        
                        let newJourney = JourneyModel(title: titleText, location: locationText, date: Date(), dots: [])
                        journeyStore.journeys.append(newJourney)
                        
                        presentationMode.wrappedValue.dismiss()
                    }).padding(.top, 50)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                Spacer()
            }
            .background(
                isDarkMode ? ColorPalette.backgroundColorDark :
                ColorPalette.backgroundColorLight)
        }
    }
}
