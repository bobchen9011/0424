//
//  historyView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/12.
//
//歷史紀錄頁面

import SwiftUI

struct historyView: View {
    @Environment (\.presentationMode) var mode
    var body: some View {
            VStack {
                List {
                    HStack { // 最近一次使用的產品
                        Image("無線筋舒福夾揉按摩帶")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("無線筋舒福夾柔按摩帶")
                            Spacer()
                            Text("肌肉狀態: 放鬆 (舉例)")
                            Spacer()
                            Text("2023/05/24 14:30")
                        }
                    }

                    HStack { // 第二近一次使用的產品
                        Image("揉捏按摩披肩")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("揉捏按摩披肩")
                            Spacer()
                            Text("肌肉狀態: 疲勞 (舉例)")
                            Spacer()
                            Text("2023/05/23 18:45")
                        }
                    }

                    HStack { // 第三近一次使用的產品
                        Image("800x (3)")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("按摩槍")
                            Spacer()
                            Text("肌肉狀態: 緊繃 (舉例)")
                            Spacer()
                            Text("2023/05/20 09:15")
                        }
                    }

                    HStack { // 第四近一次使用的產品
                        Image("5")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("按摩枕")
                            Spacer()
                            Text("肌肉狀態: 經常使用 (舉例)")
                            Spacer()
                            Text("2023/05/18 21:10")
                        }
                    }

                    HStack { // 第五近一次使用的產品
                        Image("4")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("筋膜槍")
                            Spacer()
                            Text("肌肉狀態: 柔軟 (舉例)")
                            Spacer()
                            Text("2023/05/16 12:05")
                        }
                    }

                    HStack { // 第六近一次使用的產品
                        Image("3")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("筋膜槍")
                            Spacer()
                            Text("肌肉狀態: 疲勞 (舉例)")
                            Spacer()
                            Text("2023/05/12 08:20")
                        }
                    }

                    HStack { // 最久以前使用的產品
                        Image("2")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 120, height: 80)
                        VStack {
                            Text("筋膜槍")
                            Spacer()
                            Text("肌肉狀態: 緊繃 (舉例)")
                            Spacer()
                            Text("2023/05/08 15:40")
                        }
                    }

                    }
                    .navigationBarTitle(Text("歷史紀錄"))       //目錄標題
            }
            
    }
}



struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        historyView()
    }
}
