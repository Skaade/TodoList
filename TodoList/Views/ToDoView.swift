//
//  ToDoView.swift
//  TodoList
//
//  Created by dmu mac 25 on 22/02/2023.
//

import SwiftUI

struct ToDoView: View {
    
    @EnvironmentObject var toDoVM: ToDoViewModel
    
    @State private var showAddView = false
    
    @State var seeStuff: SeeStuff = .all
    
    enum SeeStuff: String, CaseIterable, Identifiable	{
        case all
        case completed
        case imcompleted
        var id: String {self.rawValue}
    }
    
    var ToDosToShow: [ToDo] {
            switch seeStuff {
            case .all:
                return toDoVM.getTodo()
            case .completed:
                return toDoVM.getCompleteToDos()
            case .imcompleted:
                return toDoVM.getImcompleteToDos()
            }
        }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(ToDosToShow){ td in
                        NavigationLink{
                            ToDoDetailView(todo: td)
                        } label: {
                            HStack{
                                ZStack{
                                    td.completed ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "x.circle.fill")
                                }
                                .foregroundColor(td.completed ? .green : .red)
                                Text(td.name)
                            
                            }
                            
                        }
                        .swipeActions(edge: .leading) {
                            // Swipe left action
                            Button {
                                self.toDoVM.toggleCompleted(
                                    self.toDoVM.todos.firstIndex(
                                        where: { $0.id == td.id })!)
                                
                            } label: {
                                td.completed ?
                                Label("Swipe left", systemImage: "xmark") :                       Label("Swipe left", systemImage: "checkmark")
        
                            }
                            .tint(td.completed ? .red : .green)

                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            // Swipe left action
                            Button(role: .destructive) {
                                self.toDoVM.todos.remove(at:
                                    self.toDoVM.todos.firstIndex(
                                        where: { $0.id == td.id })!)
                                
                            } label: {
                                Label("Swipe left", systemImage: "trash")
                            }
                            .tint(.red)

                        }
                    
//                        .background(td.completed ? .green : .red)

                        //Color(red: 1, green: 1, blue: 1, opacity: 0/1)
                        
                    }
//                    .onDelete { indexSet in
//                        self.toDoVM.todos.remove(self.toDoVM.todos.firstIndex(
//                            where: { $0.id == td.id })!))
//                    }
                    
                
//                    .swipeActions(edge: .trailing) {
//                        // Swipe left action
//                        Button(role: .destructive) { IndexSet in
//                            self.toDoVM.todos.remove(atOffsets: IndexSet)
//
//                        } label: {
//                            Label("Swipe left", systemImage: "arrow.left")
//                        }
//                    }
                
                
                                   
            }
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showAddView = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigation){
                    Picker("Items", selection: $seeStuff) {
                        ForEach(SeeStuff.allCases) { ss in
                            Text(ss.rawValue.capitalized).tag(ss)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .sheet(isPresented: $showAddView) {
                AddView()
                    .preferredColorScheme(.dark)
            }
            .navigationBarTitle("Todo List")
        }
        .onChange(of: seeStuff) { _ in
            	
                    // This forces the view to update when the selected option changes
                    // and show the new items in the list.
                    // We could also update the list items directly here.
//                    DispatchQueue.main.async {
//                        self.selectedOption = self.selectedOption
//                    }
        
                }
        
        
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView().environmentObject(ToDoViewModel())
            .preferredColorScheme(.dark)
    }
}
