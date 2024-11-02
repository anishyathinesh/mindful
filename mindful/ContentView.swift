//
//  ContentView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI

struct ContentView: View {

    @State private var goal: String = ""
    @State private var affirmation: String = ""
    
    @State private var goals: [String] = []
    @State private var affirmations: [String] = []
    
    var body: some View {
        VStack {
            Text("good afternoon, Anishya")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Text("write some affirmations/goals for your day")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Form {
                Section(header: Text("[ i am... ]")) {
                    TextField("enter affirmation...", text: $goal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section(header: Text("[ today, i will...]")) {
                    TextField("enter goal...", text: $affirmation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
