//
//  Item.swift
//  ScrollViewTutorial
//
//  Created by Michael Smirnov on 7/22/21.
//

import Foundation

struct Item: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
}
