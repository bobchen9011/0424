//
//  introduceProductFeaturesView2.swift
//  go
//
//  Created by e530 on 2022/12/22.
//

import SwiftUI

struct introduceProductFeaturesView2: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: {
                ledControl()
            }) {
                HStack(spacing: 16) {
                    Spacer()
                    Text("連接此裝置")
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                        .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                        .cornerRadius(20)
                    Spacer()
                }
            }
            Spacer()
            Text("無線筋舒福夾揉按摩帶")
                .font(.title)
                
            VStack(alignment: .leading) {
                Text("")
                Text("．全新”夾揉”專利設計，按摩體感更到位")
                Text("．可調整正反轉、溫熱、強弱力道")
                Text("．15分鐘自動定時設計")
                Text("．魔鬼貼帶設計，可不用手抓握帶子")
                Text("．軟質矽膠按摩頭，更加舒適")
            }.multilineTextAlignment(.leading)
            
            Image("無線筋舒福夾揉按摩帶")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
            
            VStack {
                Image("easygogo_function1")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function2")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function3")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function4")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function5")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function6")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function7")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("easygogo_function8")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
            }
        }.navigationTitle("按摩帶介紹")
    }
}

struct introduceProductFeaturesView2_Previews: PreviewProvider {
    static var previews: some View {
        introduceProductFeaturesView2()
    }
}
