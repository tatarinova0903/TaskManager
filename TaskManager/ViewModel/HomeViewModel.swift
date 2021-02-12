//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Дарья on 10.02.2021.
//  Copyright © 2021 Дарья. All rights reserved.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData sheet ...
    @Published var isNewData = false
    
    // MARK: Checking and updating date
//    let calendar = Calendar.current
//    func checkDate() -> String {
//        if calendar.isDateInToday(date) {
//            return "Today"
//        } else if calendar.isDateInTomorrow(date) {
//            return "Tommorow"
//        } else {
//            return "Other day"
//        }
//    }
    
    
//    func updateDate(value: String) {
//        if value == "Today" {
//            date = Date()
//        } else if value == "Tommorow" {
//            date = calendar.date(byAdding: .day, value: 1, to: Date())!
//        } else {
//            // do smth
//        }
//    }
    
    // MARK: writing data
    func writingData(context: NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.content_ = content
        newTask.date_ = date
        print(newTask)
        try! context.save()
//        do {
//            try context.save()
//            // succes means closing view
//            isNewData = false
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}
