//
//  ContentViewModel.swift
//  ScrollViewTutorial
//
//  Created by Michael Smirnov on 7/22/21.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published var itemArray = [Item]()
    
    func addItemToArray() {
        let newItem = Item("Some new item")
    }
    
}
