//
//  introduceProductFeaturesView.swift
//  go
//
//  Created by e530 on 2022/12/21.
//

import SwiftUI

struct introduceProductFeaturesView3: View {
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
            Text("熱敷小腿按摩器")
                .font(.title)
                
            VStack(alignment: .leading) {
                Text("")
                Text("．氣壓與震動多種模式，三檔力道調節")
                Text("．魔鬼氈設計鬆緊可調、網布透氣材質")
                Text("．小腿全包覆揉捏按摩，呵護每處細節")
                Text("．魔鬼貼帶設計，可不用手抓握帶子")
                Text("．按摩同時熱敷，給您最頂級的享受～")
            }.multilineTextAlignment(.leading)
            
            Image("小腿按摩器")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
            
            VStack {
                Image("小腿按摩器1")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器2")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器3")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器4")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器5")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器6")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器7")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("小腿按摩器8")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
            }
        }.navigationTitle("小腿按摩器介紹")
    }
}

struct introduceProductFeaturesView3_Previews: PreviewProvider {
    static var previews: some View {
        introduceProductFeaturesView3()
    }
}
