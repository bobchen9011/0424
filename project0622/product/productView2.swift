//
//  productView2.swift
//  go
//
//  Created by e530 on 2022/12/26.
//

import SwiftUI

struct productView2: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
            List {
                NavigationLink(destination: introduceProductFeaturesView2()) {
                    HStack{
                        Image("無線筋舒福夾揉按摩帶")
                            .resizable()
                            .scaledToFill()
                        Text("筋舒福夾揉按摩帶")
                    }
                }
                NavigationLink(destination: introduceProductFeaturesView2()) {
                    HStack{
                        Image("揉捏按摩披肩")
                            .resizable()
                            .scaledToFill()
                        Text("揉捏按摩披肩")
                    }
                }
                NavigationLink(destination: introduceProductFeaturesView2()) {
                    HStack{
                        Image("U型肩頸按摩枕")
                            .resizable()
                            .scaledToFill()
                        Text("U型肩頸按摩枕")
                    }
                }
            }
            .navigationTitle("按摩帶選擇")
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

struct productView2_Previews: PreviewProvider {
    static var previews: some View {
        productView2()
    }
}
