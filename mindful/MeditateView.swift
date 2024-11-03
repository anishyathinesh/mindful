//
//  MeditateView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI

struct MeditateView: View {
    @ObservedObject var sharedData: SharedData
    @State private var timeRemaining = 300
    @State private var isRunning = false
    @State private var showEditor = false
    
    var body: some View {
        ZStack {
            Color(red: 137/255, green: 204/255, blue: 249/246)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            showEditor = true
                        }) {
                            Text("edit goals & affirmations")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.clear)
                                .cornerRadius(8)
                        }
                        .fullScreenCover(isPresented: $showEditor) {
                            ContentView()
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                
                Text("meditate on your ideas")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("\(timeString(time: timeRemaining))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("things to remember:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<sharedData.goals.count, id: \.self) { index in
                            Text("today, i will \(sharedData.goals[index].text)")
                                .padding()
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            Spacer().frame(height: 20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<sharedData.affirmations.count, id: \.self) { index in
                            Text("i am \(sharedData.affirmations[index].text)")
                                .padding()
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            Spacer().frame(height: 20)
                        }
                    }
                }
                .padding()
                Button(action: {
                    isRunning.toggle()
                }) {
                    Text(isRunning ? "Pause" : "Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .padding(.horizontal, 40)
                Spacer()
                
            }
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                if isRunning && timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
        }
    }

    private func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    MeditateView(sharedData: SharedData())
}
