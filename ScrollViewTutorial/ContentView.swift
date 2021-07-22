//
//  ContentView.swift
//  ScrollViewTutorial
//
//  Created by Michael Smirnov on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentViewModel()
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(contentVM.itemArray, id: \.id) { item in
                        Text(item.text)
                            .padding()
                            .id(item.id)
                    }
                    .onAppear {
                        scrollProxy = proxy
                    }
                    Spacer()
                }
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
        .onChange(of: contentVM.itemArray, perform: { _ in
            scrollToBottom()
        })
        
    }
    
    func didTapAddItemButton() {
        contentVM.addItemToArray()
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(contentVM.itemArray.last?.id, anchor: .bottom)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentVM: ContentViewModel())
    }
}
