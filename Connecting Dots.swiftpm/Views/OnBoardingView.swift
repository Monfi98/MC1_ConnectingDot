import SwiftUI

struct OnboardingView: View {
    @Binding var showModal: Bool
    
   var body: some View {
        NavigationStack {
            TabView {
                ForEach(OnboardingPage.pageData) { page in
                    OnboardingPageView(page: page, showModal:$showModal)
                }
                .toolbar(.hidden)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(.white)
            .transition(.move(edge: .leading))
        }
    }
    
}


struct OnboardingPageView: View {
    var page: OnboardingPage
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {

            Text(page.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .padding(.top, 60)
                .padding(.bottom, 50)
            
            if page.isButtonShow {
                
                NavigationLink {
                    IceBreakingView(showModal: $showModal, currentLevel: 0)
                } label: {
                    Text("시작하기")
                        .foregroundColor(ColorPalette.fontWhite)
                        .frame(width: 250, height: 40)
                        .background(ColorPalette.primaryColor)
                        .cornerRadius(30)
                }
            }
            Spacer()
        }.padding(.top, 100)
    }
}

struct OnboardingPage: Identifiable {
    let id = UUID()
    
    var title: String
    var imageName: String
    var isButtonShow: Bool
    
    // 예제 데이터
    static let pageData = [
        OnboardingPage(title: "Connecting Dot은\n당신의 경험을\n되돌아볼 수 있도록 도와줄거에요.", imageName: "Dots1", isButtonShow: false),
        OnboardingPage(title: "점을 하나하나 찍어\n경험을 되돌아보고 \n기록해 보세요.", imageName: "Dots2", isButtonShow: false),
        OnboardingPage(title: "\n이제 시작해볼게요!\n", imageName: "Dots3", isButtonShow: true),
    ]
}
