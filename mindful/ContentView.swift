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
                .padding()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
