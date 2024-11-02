//
//  ContentView.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI

struct ContentView: View {
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
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
