//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer() // Push left or right
                
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
            } // end of the HStack
            .padding()
            Spacer() // push up
            
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
            
        } // end of the VStack
        
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
        
        Spacer() // push up
            .padding()
        
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
