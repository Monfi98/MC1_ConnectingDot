import SwiftUI


struct CustomProgressBar: View {
    let progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(ColorPalette.secondaryColor)
                .frame(height: 5)
                .cornerRadius(6.5)
            
            Rectangle()
                .foregroundColor(ColorPalette.primaryColor)
                .frame(width: CGFloat(self.progress) * 300, height: 5)
                .animation(.easeOut(duration: 1), value: progress)
                .cornerRadius(6.5)
        }
        .frame(height: 20)
        .frame(width: 300)
    }
}
