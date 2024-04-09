//
//  introduceProductFeaturesView.swift
//  go
//	
//  Created by e530 on 2022/12/21.
//

import SwiftUI

struct introduceProductFeaturesView: View {
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
            Text("雷電滴滴 熱敷感壓按摩槍")
                .font(.title)
                
            VStack(alignment: .leading) {
                Text("")
                Text("．震動+熱敷+電波，獨家三合一功能")
                Text("．12段震動按摩 x 4種按摩頭")
                Text("．3段溫感熱敷")
                Text("．6段電波，放鬆肌肉達到舒緩效果")
            }.multilineTextAlignment(.leading)
            
            Image("800x (3)")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
            
            VStack {
                Image("con_fe813_function1")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function2")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function3")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function4")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function5")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function6")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function7")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function8")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                Image("con_fe813_function9")
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
            }
        }.navigationTitle("按摩槍介紹")
    }
}

struct introduceProductFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        introduceProductFeaturesView()
    }
}
