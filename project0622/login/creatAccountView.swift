//
//  logoutView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//

import SwiftUI
import Firebase
import RiveRuntime

struct creatAccountView: View {
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    @State var email = ""
    @State var password = ""
    @State var fname = ""
    @State var lname = ""
    @State var StatusMessage = ""
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                VStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 64))
                        .padding()
                        .foregroundColor(Color(.label))                     //設定使用者頭像屬性
                }.overlay(RoundedRectangle(cornerRadius: 64)
                    .stroke(Color.black, lineWidth: 3)
                )
                Group {
                    TextField("姓氏", text: $fname)
                    TextField("名字", text: $lname)
                    TextField("信箱", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("密碼",text: $password)                 //輸入密碼為＊號
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                
                button.view()
                    .frame(width: 236, height: 64)
                    .overlay(
                        Label("開始註冊", systemImage: "arrow.forward")
                            .offset(x: 4, y: 4)
                            .font(.headline)
                    )
                    .background(
                        Color.black
                            .cornerRadius(30)
                            .blur(radius: 10)
                            .opacity(0.3)
                            .offset(y: 10)
                    )
                    .onTapGesture {
                        button.play(animationName: "active")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation(.spring()) {
                                showModal = true
                            }
                        }
                }
                Button {
                    createNewAccount()                                      //創建建立按鈕
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                        Text("遊客登入")
                            .foregroundColor(Color.black)
                            .padding()
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
                    }
                    .background(Color.gray)
                    .cornerRadius(10)
                }
                Button {
                    createNewAccount()                                      //創建建立按鈕
                } label: {
                    HStack {
                        Spacer()
                        Image("picwish")
                            .resizable()
                            .scaledToFit()
                        Text("Google 登入")
                            .foregroundColor(Color.black)
                            .padding()
                            .font(.system(size: 25, weight: .semibold))
                        Spacer()
                    }
                    .frame(width: 300, height: 75)
                    .background(Color.gray)
                    .cornerRadius(10)
                }
                //Text(self.StatusMessage)
                //  .foregroundColor(Color.black)
                Spacer()
            }
            .padding()
        }
    }
    private func handleAction() {
        createNewAccount()
    }
    private func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password) {result, err in
            if let err = err {
                print("註冊失敗", err)
                self.StatusMessage = "註冊失敗: \(err)"
                return
            }
            print("註冊成功: \(result?.user.uid ?? "")")
            self.StatusMessage = ("註冊成功: \(result?.user.uid ?? "")")
        }
    }
}


struct logoutView_Previews: PreviewProvider {
    static var previews: some View {
        creatAccountView()
    }
}
