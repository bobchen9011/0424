//
//  socialShareView.swift
//  project0622
//
//  Created by bbob on 2023/9/17.
//

import Foundation
import SwiftUI

struct socialShareView: View {
    @State private var sharingText = "分享按摩经验和治疗成果。"

    var body: some View {
        VStack {
            Text(sharingText)
                .padding()

            Button(action: {
                shareContent()
            }) {
                Text("分享到社交媒体")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("社交分享", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
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

struct socialShareView_Previews: PreviewProvider {
    static var previews: some View {
        socialShareView()
    }
}
