//
//  ContentView.swift
//  TaskManager
//
//  Created by Дарья on 10.02.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
