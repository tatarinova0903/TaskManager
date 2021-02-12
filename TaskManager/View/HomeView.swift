//
//  HomeView.swift
//  TaskManager
//
//  Created by Дарья on 10.02.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @ObservedObject var homeData = HomeViewModel()
    
    @FetchRequest var results: FetchedResults<Task>
    
    init() {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.sortDescriptors = [NSSortDescriptor(key: "date_", ascending: true)]
        _results = FetchRequest(fetchRequest: request)
    }
    
//    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var results: FetchedResults<Task>
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack(spacing: 0) {
                HStack{
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                // Empty View....
                
                if results.isEmpty {
                    HStack {
                        Spacer()
                        Text("No Tasks !!!")
                            .font(.title)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(results, id: \.self) { task in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(task.content_ ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(task.date_?.description ?? Date().description)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                
                Spacer()
                
                // Add Button ...
                HStack {
                    Spacer()
                    Button(action: {
                        self.homeData.isNewData = true
                    }) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(AngularGradient(gradient: Gradient(colors: [Color("Light"), Color("Dark")]), center: .center))
                            .clipShape(Circle())
                    }
                    } .padding()
            }
            .sheet(isPresented: $homeData.isNewData) {
                NewDataView(homeData: self.homeData)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
