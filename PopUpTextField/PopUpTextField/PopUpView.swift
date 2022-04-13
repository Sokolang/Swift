//
//  PopUpView.swift
//  PopUpTextField
//
//  Created by Anzhelika Sokolova on 13.04.2022.
//

import SwiftUI

struct PopUpView: View {
    @Binding var removePopUp: Bool
    @State var itemNameForTextField = String()
    @Binding var addTextItem: [String]
    var body: some View {
        ZStack {
            Color(.systemGray3).edgesIgnoringSafeArea(.all).cornerRadius(10)
            VStack {
                TextField("enter item", text: $itemNameForTextField)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .background(Color.white)
                Button("Done") {
                    if itemNameForTextField != "" {
                        addTextItem.append(itemNameForTextField)
                    }
                    self.removePopUp.toggle()
                }
            }
            .padding()
        }
    }
}

struct ClearFullCoverBackGround: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async{
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
