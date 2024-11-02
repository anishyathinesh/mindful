//
//  SharedData.swift
//  mindful
//
//  Created by Anishya Thinesh on 11/2/24.
//

import SwiftUI
import Combine

class SharedData: ObservableObject {
    @Published var goals: [String] = [""]
    @Published var affirmations: [String] = [""]
}
