
//
//  AddFormPageViewModel.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import SwiftUI
import Combine

class AddFormPageViewModel: ObservableObject {
    private let itemsKey = "todo_items"
    private let replacementIndexKey = "todo_replacement_index"
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
        loadSavedItems()
    }

    func addItem(text: String){
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let target = replacementIndex % defaultItemTexts.count
        if items.indices.contains(target) {
            items[target] = ToDoModel(text: text)
        }
        replacementIndex = (replacementIndex + 1) % defaultItemTexts.count
        saveItems()
    }
    
    func deleteItem(item: IndexSet) {
        for index in item where defaultItemTexts.indices.contains(index) {
            items[index] = ToDoModel(text: defaultItemTexts[index])
        }
        saveItems()
    }

    private func loadSavedItems() {
        if let savedTexts = UserDefaults.standard.stringArray(forKey: itemsKey),
           savedTexts.count == defaultItemTexts.count {
            items = savedTexts.map { ToDoModel(text: $0) }
        }

        let savedIndex = UserDefaults.standard.integer(forKey: replacementIndexKey)
        if defaultItemTexts.indices.contains(savedIndex) {
            replacementIndex = savedIndex
        }
    }

    private func saveItems() {
        UserDefaults.standard.set(items.map(\.text), forKey: itemsKey)
        UserDefaults.standard.set(replacementIndex, forKey: replacementIndexKey)
    }

}
