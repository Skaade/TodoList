//
//  ToDoViewModel.swift
//  TodoList
//
//  Created by dmu mac 25 on 22/02/2023.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var todos = [ToDo]()
    
    init(){
        todos.append(ToDo(
            "Spis æble kage", "Mormor har lavet en æble kage som der skal spises"))
        todos.append(ToDo(
            "Spis tærte", "Søs har lavet en tærte som der skal spises"))
        todos.append(ToDo(
            "Spis lagkage", "Farmor har lavet en lagkage som der skal spises"))
    }
    
    private func setTodo(_ toDoList: [ToDo]){
        self.todos = toDoList
    }
    
    public func getTodo() -> [ToDo] {
        return todos
    }
    
//    public func toggleCompleted(_ toDo: ToDo){
//        if(toDo.completed){toDo.completed=false}
//        else {toDo.completed = true}
//    }
    public func toggleCompleted(_ index: Int){
        if(self.todos[index].completed == false) {
            self.todos[index].completed = true
        }
        else {self.todos[index].completed = false
        }
    }
    
    
    public func getImcompleteToDos() -> [ToDo]{
        var todoscopy = [ToDo]()
        for td in todos{
            if(!td.completed){
                todoscopy.append(td)
            }

        }
        return todoscopy
        
    }
    
    public func getCompleteToDos() -> [ToDo]{
        var todoscopy = [ToDo]()
        for td in todos{
            if(td.completed){
                todoscopy.append(td)
            }

        }
        return todoscopy
        
    }
    
    
    
}
