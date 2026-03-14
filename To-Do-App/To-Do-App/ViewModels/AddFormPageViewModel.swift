//
//  AddFormPageViewModel.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI
import Combine

class AddFormPageViewModel: ObservableObject {
    @Published var items: [ToDoModel] = [
        ToDoModel(text: "Item 1"),
        ToDoModel(text: "Item 2"),
        ToDoModel(text: "Item 3"),
        ToDoModel(text: "Item 4"),
        ToDoModel(text: "Item 5")
    ]
    @Published var replacementIndex: Int = 0

    func addItem(text: String){
        let indicesToReplace = [0, 1, 2, 3, 4]
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let target = indicesToReplace[replacementIndex % indicesToReplace.count]
        if items.indices.contains(target) {
            items[target] = ToDoModel(text: text)
        }
        replacementIndex = (replacementIndex + 1) % indicesToReplace.count
    }
    
    func deleteItem(item: IndexSet) {
        items.remove(atOffsets: item)
    }

}

