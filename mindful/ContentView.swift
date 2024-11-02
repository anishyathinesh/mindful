//
//  ContentView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI

struct ContentView: View {

    @State private var goals: [String] = [""]
    @State private var affirmations: [String] = [""]
    
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
            
            ScrollView {
                VStack {
                    Section(header: Text("[ i am... ]")) {
                        ForEach(affirmations.indices, id: \.self) { index in
                            HStack {
                                TextField("enter affirmation...", text: $affirmations[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    deleteAff(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        Button(action: {
                            affirmations.append("")
                            print(affirmations)
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    .padding()
            
                    
                    Section(header: Text("[ i will... ]")) {
                        ForEach(0..<goals.count, id: \.self) { index in
                            HStack {
                                TextField("enter goal...", text: $goals[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    deleteGoal(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        Button(action: {
                            goals.append("")
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    .padding()
                }
            }
            .background(Color.clear)
            
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
            }
            .padding()
        }
        .padding()
        .background(Color.clear.edgesIgnoringSafeArea(.all))
    }
    
    func deleteGoal(at index: Int) {
        goals.remove(at: index)
        if goals.isEmpty {
            goals.append("")
        }
    }
    
    func deleteAff(at index: Int) {
        affirmations.remove(at: index)
        if affirmations.isEmpty {
            affirmations.append("")
        }
    }
}

#Preview {
    ContentView()
}
