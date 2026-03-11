//
//  ToDoModel.swift
//  To-Do-App
//
//  Created by Javid Gafarli on 11.03.26.
//

import Foundation

struct ToDoModel:Identifiable {
    let id: UUID = UUID()
    let text: String
}
