//
//  experiView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//

import SwiftUI

struct experiView: View {
    var body: some View {
        
            VStack(alignment: .center) {
                Spacer()
                NavigationLink {
                    collectView()
                    
                } label: {
                    Text("歷史紀錄")
                        .customFont(.headline)
                        .padding(20)
                        .frame(width: 250)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                    .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                    .cornerRadius(20)
                }
                Spacer()
                NavigationLink {
                    recentView()
                } label: {
                    Text("近期紀錄")
                        .customFont(.headline)
                        .padding(20)
                        .frame(width: 250)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                    .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                    .cornerRadius(20)
                }
                Spacer()
                NavigationLink {
                    AnalysisView()
                } label: {
                    Text("肌肉紀錄分析")
                        .customFont(.headline)
                        .padding(20)
                        .frame(width: 250)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                    .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                    .cornerRadius(20)
                }
                Spacer()
            }
            .navigationTitle("設備體驗紀錄")   
    }
}

struct experiView_Previews: PreviewProvider {
    static var previews: some View {
        experiView()
    }
}
