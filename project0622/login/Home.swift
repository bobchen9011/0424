//
//  Home.swift
//  project0622
//
//  Created by bbob on 2023/9/24.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        VStack(spacing: 15) {
            Text("登入成功")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Button(action: {
                do {
                    try Auth.auth().signOut()
                    withAnimation {
                        status = false
                    }
                } catch {
                    // 处理异常
                    print("登出时发生错误: \(error.localizedDescription)")
                }
            }, label: {
                Text("登出")
                    .fontWeight(.heavy)
            })

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
