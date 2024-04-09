//
//  SwiftUIView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/18.
//

import SwiftUI
import RiveRuntime
import Firebase

struct creatView: View {
    @Environment(\.presentationMode) var backToLogin     //創建一個環境變量
    @State var email = ""
    @State var password = ""
    @State var fname = ""
    @State var lname = ""
    @State var StatusMessage = ""
    @State var showCreatView = false
    var body: some View {
        
        NavigationView {
            VStack(spacing: 15) {
                    Text("註冊帳號")
                        .customFont(.largeTitle)
                VStack(alignment: .leading) {
                    Text("姓氏")
                        .customFont(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("", text: $fname)
                        .customTextField()
                }
                
                VStack(alignment: .leading) {
                    Text("名字")
                        .customFont(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("", text: $lname)
                        .customTextField()
                }
                
                VStack(alignment: .leading) {
                    Text("信箱")
                        .customFont(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("", text: $email)
                        .customTextField()
                }
                
                VStack(alignment: .leading) {
                    Text("密碼")
                        .customFont(.subheadline)
                        .foregroundColor(.secondary)
                    SecureField("", text: $password)
                        .customTextField(image: Image("Icon Lock"))
                }
                
                Button {
                    createNewAccount()
                } label: {
                    Label("建立帳號", systemImage: "arrow.right")
                        .customFont(.headline)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                    .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                    .cornerRadius(20)
                }
                
                HStack {
                    Rectangle().frame(height: 1).opacity(0.1)
                    Text("OR").customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
                    Rectangle().frame(height: 1).opacity(0.1)
                }
                
                Text("使用信箱, 蘋果 或是 Google 登入")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Image("Logo Email")
                    Spacer()
                    Image("Logo Apple")
                    Spacer()
                    Image("Logo Google")
                }
            }
            .padding(30)
            .background(.regularMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.linearGradient(colors: [.blue.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .navigationBarItems(trailing: Button(action: {                         //點擊關閉彈跳視窗
                self.backToLogin.wrappedValue.dismiss()                            //回到登入頁面
            }, label: {
                Image(systemName: "chevron.down.circle.fill")
                    .foregroundColor(.black)
            }))
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        creatView()
    }
}
