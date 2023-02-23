//
//  AddView.swift
//  L06Demo
//
//  Created by dmu mac 25 on 17/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var name: String = ""
    @State var description: String = ""
//    @State var isShowingAlert: Bool = false
    
    @EnvironmentObject var toDoVM: ToDoViewModel

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Info")){
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                
    
            }
            Button {
                if (name != "")
                {
                    toDoVM.todos.append(ToDo(name, description))
                    dismiss()
                    
                }
//                isShowingAlert = true
                

            } label: {
                HStack{
                    Spacer()
                    Text("Save")
                    Spacer()
                    //Spacer er lidt ligesom en fr
                }
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(8)
//            .alert(isPresented: $isShowingAlert){
//                Alert(title: Text("Form Submitted"), message: Text("Thanks for creating your acount \(name)"),
//                      dismissButton: .default(Text("Ok")){
//                    dismiss()
//                })
//            }
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
//                AddView(SAW: .constant(true))
        AddView()
            .preferredColorScheme(.dark)
    }
}
