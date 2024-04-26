import SwiftUI

struct DotsList: View {
   @Binding var dots: [Dot]
    var journeyIndex: Int

    var body: some View {
        
        List{
            ForEach(dots.indexed(), id: \.element.id) { index, dot in
                NavigationLink(destination: EditDotView(journeyIndex: journeyIndex, dotIndex: index), label: {
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .padding(.leading, 10)
                            .padding(.trailing, 15)
                            .foregroundColor(ColorPalette.primaryColor)
                        HStack() {
                            Text(dot.title)
                                .font(.headline)
                            Text("[\(dot.keyword)]")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                })
                
            }.onMove(perform: moveDots)
        }
    }
    func moveDots(from source: IndexSet, to destination: Int) {
        dots.move(fromOffsets: source, toOffset: destination)
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    func indexed() -> [(offset: Int, element: Element)] {
        Array(self.enumerated())
    }
}
