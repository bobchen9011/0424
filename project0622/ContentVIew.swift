//
//  firstView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/8.
//
//主畫面

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @State private var isShowing = false                                              //為顯示的畫面設定為不顯示
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {                                                       //如果顯示
                    sideMenuView(isShowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)                              //設定中間示圖邊框角度(如果顯示:設定為20度，反之為10度)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)          //設定示圖水平(如果顯示:設定為300，反之為0)          設定示圖垂直(如果顯示:設定為44，反之為0)
                    .scaleEffect(isShowing ? 0.9 : 1)                               //設定示圖水平和垂直縮放(如果顯示:設定為0.9，反之設定為1)
                
                    .navigationBarItems(leading: Button(action: {                   //設定側邊選單按鈕
                        withAnimation(.spring()) {                                  //設定顯示側邊選單動畫
                            isShowing.toggle()
                        }
                }, label: {
                    Image(systemName: "list.bullet")                               //設定側邊選單圖示及顏色
                        .foregroundColor(.black)
                }))
                    .navigationTitle("首頁")                                       //設定示圖標題
                    .navigationBarTitleDisplayMode(.inline)                        //設定示圖標題置中
            }
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            NavigationLink {
                ledControl()
                
            } label: {
                Text("模組控制")
                    .customFont(.headline)
                    .padding(20)
                    .frame(width: 250, height: 200)
                    .background(Color(hex: "008080"))
                    .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(20)
            }
            Spacer()
            NavigationLink {
                recentView()
            } label: {
                Text("歷史肌肉狀態紀錄")
                    .customFont(.headline)
                    .padding(20)
                    .frame(width: 250, height: 200)
                    .background(Color(hex: "008080"))
                    .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(20)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}
