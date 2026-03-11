//
//  FormView.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI

struct AddFormPageView: View {
    @ObservedObject var viewmodel: AddFormPageViewModel
    @State private var item: String = ""

    var body: some View {
        Form{
            let labels = ["Item 1", "Item 2", "Item 3", "Item 5"]
            TextField(labels[viewmodel.replacementIndex % labels.count], text: $item)
            Button("Add"){
                viewmodel.addItem(text: item)
                item = ""
            }
            
        }
    }
}


#Preview {
//    AddFormPageView()
}

