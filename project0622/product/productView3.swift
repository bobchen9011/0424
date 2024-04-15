//
//  productView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//
//按摩槍選擇庫

import SwiftUI

struct productView3: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
            List {
                NavigationLink(destination: introduceProductFeaturesView3()) {
                    HStack{
                        Image("小腿按摩器")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Text("熱敷小腿按摩器")
                    }
                }
            }
            .navigationTitle("小腿按摩器選擇")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                Text("產品類別選擇")
                    .foregroundColor(.blue)
            }))
    }
}

struct productView_Previews3: PreviewProvider {
    static var previews: some View {
        productView3()
    }
}
