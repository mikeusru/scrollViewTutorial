//
//  ContentView.swift
//  ScrollViewTutorial
//
//  Created by Michael Smirnov on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(contentVM.itemArray) { item in
                    Text(item.text)
                        .padding()
                }
                Spacer()
            }
            ZStack(alignment: .bottom) {
                Button(action: {
                    didTapAddItemButton()
                }, label: {
                    Text("Add item to the list")
                        .foregroundColor(.primary)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                })
            }
        }
        
    }
    
    func didTapAddItemButton() {
        contentVM.addItemToArray()
        scrollToTop()
    }
    
    func scrollToTop() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentVM: ContentViewModel())
    }
}
