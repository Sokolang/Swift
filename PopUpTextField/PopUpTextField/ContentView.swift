//
//  ContentView.swift
//  PopUpTextField
//
//  Created by Anzhelika Sokolova on 13.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var listItems = ["iPhone", "iPad", "MacBook"]
    @State var showCustomPopUp = false
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems, id: \.self) {item in
                    Text(item)
                }
            }.fullScreenCover(isPresented: $showCustomPopUp) {
                PopUpView(removePopUp: self.$showCustomPopUp, addTextItem: self.$listItems)
                    .background(ClearFullCoverBackGround())
                    .frame(width: 250, height: 100)
            }
            .navigationTitle("List")
                .navigationBarItems(trailing: Button(action:{
                    self.showCustomPopUp.toggle()}
                                                     , label: {
                    Image(systemName: "plus")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
