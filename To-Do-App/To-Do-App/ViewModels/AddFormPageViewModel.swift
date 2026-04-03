//
//  AddFormPageViewModel.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI
import Combine

class AddFormPageViewModel: ObservableObject {
    private let defaultItemTexts = [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5"
    ]

    @Published var items: [ToDoModel]
    @Published var replacementIndex: Int = 0

    init() {
        items = defaultItemTexts.map { ToDoModel(text: $0) }
    }

    func addItem(text: String){
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let target = replacementIndex % defaultItemTexts.count
        if items.indices.contains(target) {
            items[target] = ToDoModel(text: text)
        }
        replacementIndex = (replacementIndex + 1) % defaultItemTexts.count
    }
    
    func deleteItem(item: IndexSet) {
        for index in item where defaultItemTexts.indices.contains(index) {
            items[index] = ToDoModel(text: defaultItemTexts[index])
        }
    }

}
