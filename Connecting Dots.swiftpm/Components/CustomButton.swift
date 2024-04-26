import SwiftUI

enum ButtonType {
    case big
    case small
    
    var width: CGFloat {
        switch self {
        case .big: return 250.0
        case .small: return 80.0
        }
    }
    
    var height: CGFloat {
        switch self {
        case .big: return 40.0
        case .small: return 35.0
        }
    }
}

enum ButtonEnable {
    case enable
    case disable
    
    var isEnable: Bool {
        switch self {
        case .enable: return true
        case .disable: return false
        }
    }
}

struct CustomButton: View {
    var text: String
    var type: ButtonType = .big
    var isEnable: ButtonEnable = .enable
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            switch (isEnable) {
            case .enable:
                Text(text)
                    .foregroundColor(ColorPalette.fontWhite)
                    .frame(width: type.width, height: type.height)
                    .background(ColorPalette.primaryColor)
                    .cornerRadius(30)
            case .disable:
                Text(text)
                    .foregroundColor(ColorPalette.fontWhite)
                    .frame(width: type.width, height: type.height)
                    .background(ColorPalette.disableButton)
                    .cornerRadius(30)
            }
        }
    }
}

