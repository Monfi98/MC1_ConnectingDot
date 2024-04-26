//
//  SwiftUIView.swift
//  
//
//  Created by 신승재 on 3/26/24.
//

import SwiftUI

struct JourneyDetailView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @EnvironmentObject var journeyStore: JourneyStore
    @State private var navigateToNextView = false
    @State private var isEditing = false
    @State private var dots: [Dot]
    
    let journey: JourneyModel
    let index: Int
    
    init(journey: JourneyModel, index: Int) {
        self.journey = journey
        self.index = index
        _dots = State(initialValue: journey.dots)
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                DotsList(dots: $journeyStore.journeys[index].dots, journeyIndex: index)
                //DotsList(dots: $dots)
            }
            .navigationBarItems(trailing: Button(action: {
                navigateToNextView = true
            }, label: {
                Image(systemName: "plus")
            }))
            .navigationBarItems(trailing: Button(isEditing ? "Done" : "Edit") {
                isEditing.toggle()
            })
            .navigationBarTitle("\(journey.title)(\(journey.location))")
            .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
            .background(isDarkMode ? ColorPalette.backgroundColorDark :
                            ColorPalette.backgroundColorLight)
            
        }
        .navigationDestination(isPresented: $navigateToNextView) {
            EditDotView(journeyIndex: index, dotIndex: journeyStore.journeys[index].dots.count)
        }
        .onAppear(){
            print(index)
        }

    }
}
