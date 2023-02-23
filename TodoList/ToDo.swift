//
//  ToDo.swift
//  TodoList
//
//  Created by dmu mac 25 on 22/02/2023.
//

import Foundation

struct ToDo :Identifiable {
    var id = UUID()
    var name: String
    var descriptoin: String
    var completed: Bool
//    var deadline: Date
    
    init(
        _ name: String,
        _ descriptoin: String
//        _ deadline: Date
    ) {
        self.name = name
        self.descriptoin = descriptoin
        self.completed = false
//        self.deadline = deadline
    }
    
}
