import SwiftUI

struct TitleKeywords: Identifiable {
    
    var id = UUID()
    var title: String
    var subTitle: String
    
}

struct DraggableList: View {
    
    @Binding var items: [TitleKeywords]


    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.id) { titleKeyword in
                    DotsTitleKeywords(title: titleKeyword.title, subTitle: titleKeyword.subTitle)
                }
                .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}
