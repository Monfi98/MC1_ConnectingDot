//
//  SwiftUIView.swift
//  
//
//  Created by 신승재 on 3/26/24.
//

import SwiftUI

struct EditDotView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var journeyStore: JourneyStore
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var titleText = ""
    @State private var keywordText = ""
    @State private var content = ""
    @State private var showAlert = false
    
    let journeyIndex: Int
    let dotIndex: Int
    
    var body: some View {
        
        ScrollView {
            VStack() {
                HStack {
                    Text("Dot의 이름을 알려주세요")
                        .font(.headline)
                    Spacer()
                }
                
                TextField("Dot Name", text: $titleText)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                    .cornerRadius(10)
                    .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                
                HStack {
                    Text("Dot의 키워드를 정해주세요")
                        .font(.headline)
                    Spacer()
                }
                .padding(.top, 20)
                
                
                TextField("Keyword", text: $keywordText)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                    .cornerRadius(10)
                    .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                
                HStack {
                    Text("Dot에 대한 이야기를 들려주세요")
                        .font(.headline)
                    Spacer()
                }
                .padding(.top, 20)
                
                CustomTextEditor(text: $content, isDarkMode: isDarkMode)
                    .frame(height: 200)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                    .cornerRadius(10)
                    .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                
                
                // Delete Button
                if journeyStore.journeys[journeyIndex].dots.count > dotIndex {
                    Button(action: {
//                        journeyStore.journeys[journeyIndex].dots.remove(at: dotIndex)
//                        presentationMode.wrappedValue.dismiss()
                        showAlert = true
                    }, label: {
                        HStack {
                            Text("Delete")
                                .foregroundColor(Color.white)
                            
                        } .frame(width: 300, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                    }).padding(.top, 20)
                }
                
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .navigationBarItems(trailing: Button(action: {
                
                if journeyStore.journeys[journeyIndex].dots.count == dotIndex {
                    journeyStore.journeys[journeyIndex].dots.append(Dot(title: titleText, keyword: keywordText, contents: content))
                } else {
                    journeyStore.journeys[journeyIndex].dots[dotIndex].title = titleText
                    journeyStore.journeys[journeyIndex].dots[dotIndex].keyword = keywordText
                    journeyStore.journeys[journeyIndex].dots[dotIndex].contents = content
                    
                }
                print(content)
                
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "checkmark")
            }))
            .onAppear() {
                if journeyStore.journeys[journeyIndex].dots.count > dotIndex {
                    titleText = journeyStore.journeys[journeyIndex].dots[dotIndex].title
                    keywordText = journeyStore.journeys[journeyIndex].dots[dotIndex].keyword
                    content = journeyStore.journeys[journeyIndex].dots[dotIndex].contents
                    
                }
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("삭제 확인"),
                      message: Text("이 항목을 정말 삭제하시겠습니까?"),
                      primaryButton: .destructive(Text("삭제")) {
                    
                    journeyStore.journeys[journeyIndex].dots.remove(at: dotIndex)
                    presentationMode.wrappedValue.dismiss()
                    
                },
                      secondaryButton: .cancel()
                )
            })
        }.background(
            isDarkMode ? ColorPalette.backgroundColorDark :
            ColorPalette.backgroundColorLight)
    }
}

