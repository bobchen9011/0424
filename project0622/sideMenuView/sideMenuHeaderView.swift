//
//  sideMenuHeaderView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/9.
//

import SwiftUI

struct sideMenuHeaderView: View {
    @Binding var isShowing: Bool
    @Environment(\.colorScheme) var colorScheme // 观察暗黑模式

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(colorScheme == .dark ? .white : .black) // 根据颜色模式选择颜色
                    .padding()
            }
            VStack(alignment: .leading) {
                Image("")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 120, height: 80)
                Spacer()
                HStack(spacing: 12) {
                    Text("歡迎您加入")
                        .foregroundColor(colorScheme == .dark ? .white : .black) // 根据颜色模式选择颜色
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}

struct sideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        sideMenuHeaderView(isShowing: .constant(true))
    }
}
