//
//  TodoListApp.swift
//  TodoList
//
//  Created by dmu mac 25 on 22/02/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject private var toDoVM = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoView().environmentObject(toDoVM)
                .preferredColorScheme(.dark)
        }
    }
}
