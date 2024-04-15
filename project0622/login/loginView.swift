import SwiftUI
import Firebase
import RiveRuntime

struct LoginView: View {
    @State var isLoginMode = true
    @State var email = ""
    @State var password = ""
    @State var fname = ""
    @State var lname = ""
    @State var statusMessage = ""
    @State var showCreateView = false
    @State var showProfile = false

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack {
                    Image("我的專案")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 1000)
                        .stroke(Color.black, lineWidth: 3)
                )

                VStack(alignment: .leading) {
                    Text("信箱")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    TextField("", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                VStack(alignment: .leading) {
                    Text("密碼")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    SecureField("", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Button {
                    loginUser()
                } label: {
                    Text("登入")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.vertical)
                }
                .disabled(email.isEmpty || password.isEmpty)

                Button {
                    self.showCreateView.toggle()
                } label: {
                    Label("創建帳號", systemImage: "arrow.right")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "008080"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.vertical)
                }
                .sheet(isPresented: $showCreateView) {
                    creatView()
                }

                HStack {
                    Rectangle().frame(height: 1).opacity(0.1)
                    Text("或").font(.subheadline).foregroundColor(.black.opacity(0.3))
                    Rectangle().frame(height: 1).opacity(0.1)
                }

                Text("使用信箱、蘋果或 Google 登入")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                HStack {
                    Image("Logo Email")
                    Spacer()
                    Image("Logo Apple")
                    Spacer()
                    Image("Logo Google")
                }
                .padding(.bottom)

                Text(self.statusMessage)
                    .foregroundColor(.black)
            }
            .padding(30)
            .background(Color(.systemBackground))
            .navigationBarHidden(false) // 隱藏導航欄
        }
        .background(
            NavigationLink(destination: aboutAppView(), isActive: $showProfile) {
                EmptyView()
            }
        )

    }

    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("登入失敗", err)
                self.statusMessage = "登入失敗: \(err)"
            } else {
                if let user = result?.user {
                    print("登入成功: \(user.uid)")
                    self.statusMessage = "登入成功"
                    self.showProfile = true
                    self.isLoggedIn = true
                }
            }
        }
    }

}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
