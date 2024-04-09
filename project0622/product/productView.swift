//
//  productView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//
//按摩槍選擇庫

import SwiftUI

struct productView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
            List {
                NavigationLink(destination: introduceProductFeaturesView()) {
                    HStack{
                        Image("800x (3)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Text("熱敷感壓按摩槍")
                    }
                }
                NavigationLink(destination: introduceProductFeaturesView()) {
                    HStack{
                        Image("3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Text("感壓變速筋膜槍")
                    }
                }
                NavigationLink(destination: introduceProductFeaturesView()) {
                    HStack{
                        Image("4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Text("迷你筋膜槍         ")
                    }
                }        
            }
            .navigationTitle("按摩槍選擇")
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

struct productView_Previews: PreviewProvider {
    static var previews: some View {
        productView()
    }
}
