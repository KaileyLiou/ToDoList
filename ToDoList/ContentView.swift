//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showNewTask = false
    
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
            
        } // end of the VStack
        
        if showNewTask {
            NewToDoView()
        }
        
        Spacer() // push up
        .padding()

    }
}

#Preview {
    ContentView()
}
