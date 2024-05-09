//
//  ContentView.swift
//  SoundAndVibrationTest
//
//  Created by 青山凱 on 2024/05/09.
//

import SwiftUI
import AudioToolbox

struct ContentView: View {
    @State private var selectedNumber: Int = 1
    let numbers = Array(1000...2000)  // ドラムロールで選ぶ番号の範囲

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a number", selection: $selectedNumber) {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 150)

                Button("Play Sound") {
                    playSound(num: selectedNumber)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .navigationTitle("Drum Roll and Sound")
        }
    }

    private func playSound(num: Int) {
        let systemSoundID: SystemSoundID = SystemSoundID(num)
        AudioServicesPlaySystemSound(systemSoundID)
    }
}

#Preview {
    ContentView()
}
