//
//  ItemModel.swift
//  TodoList
//
//  Created by chenxi cheng on 3/29/23.
//

import Foundation

// struct里使用let声明的变量是immutable的. This means that its properties cannot be changed once the instance is created.
// 如果想改变，最好的办法就是在这个struct里提供额外的方法
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
