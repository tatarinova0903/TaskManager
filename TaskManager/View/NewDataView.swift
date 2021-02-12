//
//  NewDataView.swift
//  TaskManager
//
//  Created by Дарья on 10.02.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI

struct NewDataView: View {
    
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Add New Task")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }.padding()
            
            // TODO: Instead of TextField use TextEditor
            TextField("Task", text: $homeData.content)
            
            Spacer()
            
            HStack {
                Text("When").font(.headline)
                Spacer()
            } .padding()
            
            // Choosing date
            HStack {
//                DateButton(title: "Today", homeData: homeData)
//                DateButton(title: "Tommorow", homeData: homeData)
                // Data Picker ...
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                .labelsHidden()
            }
            
            // Add Button ...
            Button(action: {
                self.homeData.writingData(context: self.context)
            }) {
                HStack {
                    Image(systemName: "plus").imageScale(.large)
                    Text("Add Now").font(.title)
                }
                .frame(width: UIScreen.main.bounds.width - 90)
                .foregroundColor(.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("Light"), Color("Dark")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(6)
                .padding(.bottom, 40)
                .padding(.top, 20)
            }
            
        }
        .padding()
        .background(Color.black.opacity(0.05)).edgesIgnoringSafeArea(.all)
    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView(homeData: HomeViewModel())
    }
}
