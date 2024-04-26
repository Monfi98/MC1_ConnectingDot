import SwiftUI


struct MainView: View {
    // MARK: - @AppStorage and @State
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var navigateToEditJourney = false
    @State private var isRefresh = false
    @State private var showOnboarding: Bool = true
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("My Journey")
                        .font(Font.system(size: 35))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: {
                        AddJourneyView()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(isDarkMode ? ColorPalette.fontWhite : ColorPalette.fontBlack)
                            .font(Font.system(size: 20))
                    })
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 20)
                JourneyList()
            }
            .fullScreenCover(isPresented: $showOnboarding) {
                OnboardingView(showModal: $showOnboarding)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

//
//#Preview {
//    MainView()
//}
