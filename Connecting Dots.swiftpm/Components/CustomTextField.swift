import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var placeholder: String
    var isDarkMode: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.title2)
                        .foregroundColor(ColorPalette.fontLightGray)
                        .multilineTextAlignment(.center)
                }
                TextField("", text: $text)
                    .font(.title2)
                    .foregroundColor(isDarkMode ?
                                     ColorPalette.fontWhite :  ColorPalette.fontBlack)
                    .multilineTextAlignment(.center)
                    .disableAutocorrection(true)
                    .focused($isFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isFocused = true
                        }
                    }
            }
            Rectangle()
                .frame(width:300, height:2.5)
                .foregroundColor(isDarkMode ?
                                 ColorPalette.fontWhite :  ColorPalette.fontBlack)
                .padding(.top, 5)
        }
    }
}
