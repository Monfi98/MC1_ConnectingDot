import SwiftUI

struct CustomText: View {
    var title: String
    var subTitle: String?
    var isDarkMode: Bool
    var isReversed: Bool = false
    
    var body: some View {
        VStack {
            if !isReversed {
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(isDarkMode ?
                                         ColorPalette.fontWhite : ColorPalette.fontBlack)
                    Spacer()
                }
                
                HStack {
                    Text(subTitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(isDarkMode ?
                                         ColorPalette.fontLightGray : ColorPalette.fontDarkGray)
                    Spacer()
                }
            } else {
                HStack {
                    Text(subTitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(isDarkMode ?
                                         ColorPalette.fontLightGray : ColorPalette.fontDarkGray)
                    Spacer()
                }
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(isDarkMode ?
                                         ColorPalette.fontWhite : ColorPalette.fontBlack)
                    Spacer()
                }
                
            }
        }
        .padding(.top, 10)
        .padding(.leading, 40)
    }
}

