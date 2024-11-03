//
//  PowerView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/3/24.
//

import SwiftUI


struct NavView: View {
    var body: some View {
        TabView {
            
            MeditateView(sharedData: SharedData())
                .tabItem {
                    Label("Meditation", systemImage: "figure.mind.and.body")
                }
            PowerView()
                .tabItem {
                    Label("Powers", systemImage: "star.circle.fill")
                }
            Text("Third Tab Content")
                .tabItem {
                    Label("Schedule", systemImage: "clock")
                }
        }
    }
}

struct PowerView: View {
    let frontTexts = ["Withdraw", "Pack Up", "Accomodate", "Tolerate", "Face", "Decide", "Cooperate", "Discern"]
    let backTexts = ["the ability to step back and disengage from the current situation and step into your inner mind", "the ability to stop negative/wasteful thinking", "the ability to adjust and accept the presence, ideas and desires of others", "to respond to external and internal events positively or neutrally", "the ability to confront and resolve external and internal obstacles", "the ability to follow-thru or act on a decision", "the ability to give attention, time, experience and wisdom in the service of others and work alongside them", "the ability to distinguish truth/falsehood, right/wrong, and benefit/loss"]
    
    @State private var flippedStates = Array(repeating: false, count: 8)
    
    var body: some View {
        VStack {
            Text("8 inner powers")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 2/255, green: 48/255, blue: 71/246))
                .padding()
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 20) {
                    ForEach(0..<8, id: \.self) { index in
                        CardView(
                            frontText: frontTexts[index],
                            backText: backTexts[index],
                            isFlipped: $flippedStates[index]
                        )
                        .frame(width: 175, height: 175)
                    }
                }
                .padding()
            }
        }
    }
}

struct CardView: View {
    let frontText: String
    let backText: String
    @Binding var isFlipped: Bool

    var body: some View {
        ZStack {
            if isFlipped {
                Text(backText)
                    .font(.headline)
                    .foregroundColor(Color(red: 2/255, green: 48/255, blue: 71/246))
                    .frame(width: 175, height: 175)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 2/255, green: 48/255, blue: 71/246), lineWidth: 2)
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .padding()
            } else {
                Text(frontText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 175, height: 175)
                    .background(Color(red: 137/255, green: 204/255, blue: 249/246))
                    .cornerRadius(10)
                    .padding()
            }
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    NavView()
}
