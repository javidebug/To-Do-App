//
//  ContentView.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel1 = AddFormPageViewModel()
    var body: some View {
        TabView{
            NavigationStack {
                FormPageView(vm: viewModel1)
                    .navigationTitle("Home")
            }
                .tabItem{
                    Image(systemName: "house")
                    Text("Form")
                }
            
            NavigationStack {
                AddFormPageView(viewmodel: viewModel1)
                    .navigationTitle("Form")
            }
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add list")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
