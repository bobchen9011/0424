//
//  analysisView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/12.
//
//用戶肌肉紀錄頁面製作

import SwiftUI

struct analysisView: View {
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Text("肌肉狀態")
                    Spacer()
                    Text("使用時間")
                    Spacer()
                }
                List {
                    HStack {
                        Spacer()
                        Text("肌肉放鬆")
                        Spacer()
                        Text("2023/01/01 10:10")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉緊繃")
                        Spacer()
                        Text("2023/01/02 11:20")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉正常")
                        Spacer()
                        Text("2023/01/03 12:30")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉放鬆")
                        Spacer()
                        Text("2023/01/04 13:40")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉緊繃")
                        Spacer()
                        Text("2023/01/05 14:50")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉正常")
                        Spacer()
                        Text("2023/01/06 15:00")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉放鬆")
                        Spacer()
                        Text("2023/01/07 16:10")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉緊繃")
                        Spacer()
                        Text("2023/01/08 17:20")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉正常")
                        Spacer()
                        Text("2023/01/09 18:30")
                        Spacer()
                    }

                    HStack {
                        Spacer()
                        Text("肌肉放鬆")
                        Spacer()
                        Text("2023/01/10 19:40")
                        Spacer()
                    }


                }.navigationBarTitle(Text("肌肉分析"))
            }   
    }
}

struct analysisView_Previews: PreviewProvider {
    static var previews: some View {
        analysisView()
    }
}
