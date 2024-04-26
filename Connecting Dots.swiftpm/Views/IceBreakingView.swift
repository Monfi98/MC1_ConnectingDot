import SwiftUI
import Foundation
import AVFoundation


struct IceBreakingView: View {
    // MARK: - @AppStorage and @State
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var journeyStore: JourneyStore
    @Binding var showModal: Bool
    
    @State private var text: String = ""
    @State private var selectedSegment: Int = 0
    @State private var navigateToNextView = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var progressValue: Double = 0.0
    @State private var nowDay: String = ""
    @State private var dots: [TitleKeywords] = [ TitleKeywords(title: UserInputModel.userInput[3],
                                                               subTitle: UserInputModel.userInput[4]),
                                                 TitleKeywords(title: UserInputModel.userInput[5],
                                                               subTitle: UserInputModel.userInput[6]),
                                                 TitleKeywords(title: UserInputModel.userInput[7],
                                                               subTitle: UserInputModel.userInput[8])]
    
    var currentLevel: Int
    let segmentOptions = ["None", "휴식", "집중", "활력"]
    let songs = ["none", "휴식", "집중", "활력"]
    
    
    // MARK: - function
    func playSong(for segmentIndex: Int) {
        
        if segmentIndex == 0 {
            audioPlayer?.stop()
            return
        }
        
        guard segmentIndex < songs.count + 1 else { return }
        let songName = songs[segmentIndex]
        
        guard let songPath = Bundle.main.url(forResource: songName, withExtension: "mp3") else {
            print("노래 파일을 찾을 수 없습니다: \(songName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: songPath)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("노래 재생 중 오류가 발생했습니다: \(error.localizedDescription)")
        }
    }
    
    
    // MARK: - View
    var body: some View {
        
        
        NavigationView {
            // Background Color Setup
            ZStack {
                if !isDarkMode {
                     ColorPalette.backgroundColorLight.ignoresSafeArea()
                } else {
                    ColorPalette.backgroundColorDark.ignoresSafeArea()
                    //Color(.system)
                }
                
                // Title and SubTitle
                VStack {
                    
                    if (currentLevel < 11) {
                        CustomProgressBar(progress: progressValue)
                            .padding(.top, 15)
                            .onAppear {
                                self.progressValue = 0.09 * Double(currentLevel) + 0.1
                            }
                    }
                    
                    
                    
                    CustomText(title: RecycleViewModel.pages[currentLevel].title,
                               subTitle: RecycleViewModel.pages[currentLevel].subTitle,
                               isDarkMode: isDarkMode,
                               isReversed: RecycleViewModel.pages[currentLevel].isReversed ?? false)
                    
                    
                    
                    switch(currentLevel) {
                    case 1:
                        // Light/Dark mode Toggle Button
                        HStack {
                            Text("Light")
                                .foregroundColor(isDarkMode ?
                                                 ColorPalette.fontWhite : ColorPalette.fontBlack)
                            Toggle("", isOn: $isDarkMode)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                                .labelsHidden()
                                .preferredColorScheme(isDarkMode ? .dark: .light)
                            Text("Dark")
                                .foregroundColor(isDarkMode ?
                                                 ColorPalette.fontWhite : ColorPalette.fontBlack)
                        }
                        .padding(.top, 70)
                        .padding(.bottom, 90)
                        
                        
                        
                        CustomButton(text: "다음", type: .big, action: {
                            navigateToNextView = true
                        })
                        
                        Spacer()
                        
                    case 2:
                        // SegmentControl(Sound Control)
                        Picker("", selection: $selectedSegment.onChange(playSong)) {
                            ForEach(segmentOptions.indices, id: \.self) { index in
                                Text(self.segmentOptions[index]).tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 250, height: 60)
                        .preferredColorScheme(isDarkMode ? .dark: .light)
                        .padding(.top, 70)
                        .padding(.bottom, 90)
                        
                        
                        CustomButton(text: "다음", type: .big, action: {
                            navigateToNextView = true
                        })
                        
                        Spacer()
                        
                        
                    case 11:
                        
                        DraggableList(items: $dots)
                            .scrollDisabled(true)
                        
                        CustomButton(text: "다음",type: .big, action: {
                            navigateToNextView = true
                        })
                        
                        Spacer()
                        
                    case 12:
                        
                        VStack(alignment: .leading) {
                            Text(UserInputModel.userInput[10])
                                .font(Font.system(size: 17, weight: .bold))
                                .padding(.bottom, 10)
                            HStack {
                                Text(UserInputModel.userInput[9])
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(nowDay)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            .onAppear(){
                                
                                let currentDate = Date()
                                
                                
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy년 MM월 dd일"
                                
                                nowDay = formatter.string(from: currentDate)
                            }
                            
                        }
                        .frame(width: 300, height: 60)
                        .padding()
                        .background(isDarkMode ? ColorPalette.darkModeItem : Color.white)
                        .cornerRadius(20)
                        .shadow(color: isDarkMode ? .black : .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                        .padding(.top, 30)
                        

                            
                        
                        CustomButton(text: "다음",type: .big, action: {
                            navigateToNextView = true
                        }).padding(.top, 70)
                        
                        Spacer()
                        
                    case 13:
                        
                        Button(action: {

                            let newJourney: JourneyModel = JourneyModel(title: UserInputModel.userInput[10], 
                                                                        location: UserInputModel.userInput[9],
                                                                        date: Date(),
                                                                        dots: [Dot(title: dots[0].title,
                                                                                   keyword: dots[0].subTitle,
                                                                                   contents: ""),
                                                                               Dot(title: dots[1].title, keyword: dots[1].subTitle, contents: ""),
                                                                               Dot(title: dots[2].title, keyword: dots[2].subTitle, contents: "")])
                            
                            journeyStore.journeys.append(newJourney)
                            showModal = false
                            
                        }, label: {
                            HStack {
                                Text("My Journey 보러가기")
                                    .foregroundColor(ColorPalette.fontWhite)
                                    .padding(.leading, 20)
                                Text("→")
                                    .foregroundColor(ColorPalette.fontWhite)
                                    .padding(.trailing, 20)
                                
                            } .frame(width: 250, height: 60)
                                .background(ColorPalette.primaryColor)
                                .cornerRadius(30)
                        }).padding(.top, 90)

                        Spacer()
                        
                    default:
                        // TextField
                        CustomTextField(text: $text,
                                        placeholder: RecycleViewModel.pages[currentLevel].placeholder ?? "",
                                        isDarkMode: isDarkMode)
                        .padding(.top, 80)
                        
                        
                        Spacer()
                        
                        
                        
                        // Button
                        HStack {
                            Spacer()
                            
                            if text == "" {
                                CustomButton(text: "다음",type: .small, isEnable: .disable, action: {})
                            } else {
                                CustomButton(text: "다음", type: .small, action: {
                                    UserInputModel.userInput[currentLevel] = text
                                    
                                    switch(currentLevel) {
                                    case 0:
                                        let name: String = text
                                        RecycleViewModel.pages[currentLevel + 1].subTitle = "반가워요 \(name) 님!"
                                    case 3:
                                        RecycleViewModel.pages[currentLevel + 1].subTitle = "우와~😊 \(text)!"
                                    case 5:
                                        RecycleViewModel.pages[currentLevel + 1].subTitle = "😢\(text)"
                                    case 7:
                                        RecycleViewModel.pages[currentLevel + 1].subTitle = "😎 \(text)"
                                    default:
                                        break
                                    }
                                    
                                    
                                    print(UserInputModel.userInput)
                                    navigateToNextView = true
                                })
                            }
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 10)
                    }
                }
                .navigationDestination(isPresented: $navigateToNextView) { IceBreakingView(showModal: $showModal, currentLevel: currentLevel + 1)
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isDarkMode)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Extension
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
