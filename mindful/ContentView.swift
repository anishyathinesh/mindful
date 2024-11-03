//
//  ContentView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//
import SwiftUI

struct Affirmation: Identifiable {
    let id = UUID()
    var text: String
}

struct Goal: Identifiable {
    let id = UUID()
    var text: String
}

class SharedData: ObservableObject {
    @Published var affirmations: [Affirmation] = [Affirmation(text: "")]
    @Published var goals: [Goal] = [Goal(text: "")]
}

struct ContentView: View {
    
    @ObservedObject var sharedData = SharedData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("good afternoon,\n Anishya")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Text("write some affirmations/goals for your day")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()

                ScrollView {
                    VStack(spacing: 10) {
                        affirmationsSection
                        goalsSection
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                NavigationLink(destination: MeditateView(sharedData: sharedData)) {
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
            .background(Color.clear.edgesIgnoringSafeArea(.all))
        }
    }

    var affirmationsSection: some View {
        Section(header: Text("[ i am... ]").frame(maxWidth: .infinity, alignment: .leading)) {
            ForEach(sharedData.affirmations) { affirmation in
                HStack {
                    TextField("enter affirmation...", text: Binding(
                        get: { affirmation.text },
                        set: { newValue in
                            if let index = sharedData.affirmations.firstIndex(where: { $0.id == affirmation.id }) {
                                sharedData.affirmations[index].text = newValue
                            }
                        }))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    Button(action: {
                        deleteAffirmation(affirmation)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
                .padding(.vertical, 5)
            }
            Button(action: {
                sharedData.affirmations.append(Affirmation(text: ""))
            }) {
                Image(systemName: "plus")
            }
            .padding(.top, 5)
        }
    }
    
    var goalsSection: some View {
        Section(header: Text("[ i will... ]").frame(maxWidth: .infinity, alignment: .leading)) {
            ForEach(sharedData.goals) { goal in
                HStack {
                    TextField("enter goal...", text: Binding(
                        get: { goal.text },
                        set: { newValue in
                            if let index = sharedData.goals.firstIndex(where: { $0.id == goal.id }) {
                                sharedData.goals[index].text = newValue
                            }
                        }))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    Button(action: {
                        deleteGoal(goal)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
                .padding(.vertical, 5)
            }
            Button(action: {
                sharedData.goals.append(Goal(text: ""))
            }) {
                Image(systemName: "plus")
            }
            .padding(.top, 5)
        }
    }
    
    func deleteAffirmation(_ affirmation: Affirmation) {
        if let index = sharedData.affirmations.firstIndex(where: { $0.id == affirmation.id }) {
            sharedData.affirmations.remove(at: index)
        }
    }
    
    func deleteGoal(_ goal: Goal) {
        if let index = sharedData.goals.firstIndex(where: { $0.id == goal.id }) {
            sharedData.goals.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
