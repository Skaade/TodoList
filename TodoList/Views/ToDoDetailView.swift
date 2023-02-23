//
//  ToDoDetailView.swift
//  TodoList
//
//  Created by dmu mac 25 on 22/02/2023.
//

import SwiftUI

struct ToDoDetailView: View {
    
    var todo: ToDo
    
    var body: some View {
        VStack{
            Text(todo.name)
                .font(.title)
            Text(" ")
            Text(todo.descriptoin)
            Text(" ")
            Button {
                // TODO
            } label: {
                ZStack{
                    todo.completed ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "x.circle.fill")
                }
                .foregroundColor(todo.completed ? .green : .red)
                Text(todo.completed ? "completed" : "imcompleted")
                    .foregroundColor(.white)
            }
            
//            HStack{
//                ZStack{
//                    todo.completed ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "x.circle.fill")
//                }
//                .foregroundColor(todo.completed ? .green : .red)
//                Text(todo.completed ? "completed" : "imcompleted")
//            }
        }
        
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailView(todo: ToDo("Test", "Testtesttestes"))
            .preferredColorScheme(.dark)
    }
}
