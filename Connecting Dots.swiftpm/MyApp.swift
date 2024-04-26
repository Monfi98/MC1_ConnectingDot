import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            
            //OnboardingView()
            MainView().environmentObject(JourneyStore())
        }
    }
}
// 나의 첫 깃허브
