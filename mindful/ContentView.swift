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
            Text("good afternoon,\n Anishya")
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
            Spacer()
            Button(action: {
                print("meditate button tapped.")
            }) {
                Text("meditate")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 148/255, green: 201/255, blue: 169/255))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
