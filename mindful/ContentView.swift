//
//  ContentView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var sharedData = SharedData()
    
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
                VStack(spacing: 5) {
                    Section(header: Text("[ i am... ]").frame(maxWidth: .infinity, alignment: .leading)) {
                        ForEach(sharedData.affirmations.indices, id: \.self) { index in
                            HStack {
                                TextField("enter affirmation...", text: $sharedData.affirmations[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    deleteAff(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        Button(action: {
                            sharedData.affirmations.append("")
                            print(sharedData.affirmations)
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding(.top, 5)
                    }
                    
                    Section(header: Text("[ i will... ]").frame(maxWidth: .infinity, alignment: .leading)) {
                        ForEach(0..<sharedData.goals.count, id: \.self) { index in
                            HStack {
                                TextField("enter goal...", text: $sharedData.goals[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    deleteGoal(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        Button(action: {
                            sharedData.goals.append("")
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding(.top, 5)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.clear)
            
            Spacer()
            
            NavigationLink(destination: MeditateView(sharedData: sharedData)) {
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
            }
            .padding()
        }
        .padding()
        .background(Color.clear.edgesIgnoringSafeArea(.all))
    }
    
    func deleteGoal(at index: Int) {
        sharedData.goals.remove(at: index)
        if sharedData.goals.isEmpty {
            sharedData.goals.append("")
        }
    }
    
    func deleteAff(at index: Int) {
        sharedData.affirmations.remove(at: index)
        if sharedData.affirmations.isEmpty {
            sharedData.affirmations.append("")
        }
    }
}

#Preview {
    ContentView()
}
