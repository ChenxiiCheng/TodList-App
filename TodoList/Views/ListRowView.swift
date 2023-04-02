//
//  ListRowView.swift
//  TodoList
//
//  Created by chenxi cheng on 3/29/23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "first test", isCompleted: true)
    static var item2 = ItemModel(title: "second test", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        // ListRowView(title: "This is the first title")
    }
}
