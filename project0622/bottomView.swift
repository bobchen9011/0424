//
//  bottomView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/8.
//

import SwiftUI


struct bottomView: View {
    var body: some View {
       	
            TabView {
                Text("").tabItem {
                    Image(systemName: "arkit").foregroundColor(.red)
                    Text("歷史紀錄 ")
                }
                Text("").tabItem {
                    Image(systemName: "star").foregroundColor(.red)
                    Text("近期紀錄")
                }
                Text("").tabItem {
                    Image(systemName: "airplane").foregroundColor(.red)
                    Text("肌肉分析")
                }
            }
            .frame(height: 50)
    }
}

struct bottomView_Previews: PreviewProvider {
    static var previews: some View {
        bottomView()
    }
}
