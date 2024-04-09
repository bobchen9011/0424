//
//  SocialShareView.swift
//  project0622
//
//  Created by bbob on 2023/9/17.
//

import SwiftUI

struct SocialShareView: View {

    @State private var sharingText = "分享按摩成果。"
    @Environment(\.presentationMode) var mode

    var body: some View {
        VStack {
            Text(sharingText)
                .padding()

            Button(action: {
                shareContent()
            }) {
                Text("分享到社交")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("社交分享")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
            Text("首頁")
                .foregroundColor(.blue)
        }))
    }

    func shareContent() {
        let activityViewController = UIActivityViewController(
            activityItems: [sharingText],
            applicationActivities: nil
        )

        UIApplication.shared.windows.first?.rootViewController?.present(
            activityViewController,
            animated: true,
            completion: nil
        )
    }
}

struct SocialShareView_Previews: PreviewProvider {
    static var previews: some View {
        SocialShareView()
    }
}
