//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer() // Push left or right
                
                Button {
                    
                } label: {
                    Text("+")
                }
                
            } // end of the HStack
            .padding()
        } // end of the VStack
        Spacer() // push up
        .padding()
    }
}

#Preview {
    ContentView()
}
