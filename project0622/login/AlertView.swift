//
//  AlertView.swift
//  project0622
//
//  Created by bbob on 2023/9/20.
//

import SwiftUI

struct AlertView: View {
    var msg: String
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Text(msg)
                .foregroundColor(.gray)
            
            Button(action: {
                    show.toggle()
            }) {
                Text("Close")
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.yellow)
                    .cornerRadius(15)
                    .padding(.horizontal,25)
            }
            .frame(alignment: .center)
        })
        .padding()  
        .background(Color.white)
        .cornerRadius(15)
        
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

