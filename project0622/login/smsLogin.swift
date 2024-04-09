////
////  smsLogin.swift
////  project0622
////
////  Created by bbob on 2023/9/18.
////
//
//import SwiftUI
//
//struct smsLogin: View {
//    @StateObject var loginData = LoginViewModel()
//    var body: some View {
//        ZStack {
//            VStack{
//                VStack {
//                    Text("Cotinune with phone")
//                        .font(.title2)
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.black)
//                        .padding()
//                    Image("SMSReceiveFree-Logo")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .padding()
//                    Text("你會接收到四位元號碼")
//                        .font(.title2)
//                        .foregroundColor(.gray)
//                        .multilineTextAlignment(.center)
//                        .padding()
//
//                    HStack {
//                        VStack(alignment: .leading, spacing: 6) {
//
//                            Text("輸入號碼")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//
//                            Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
//                                .font(.title2)
//                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                .foregroundColor(.black)
//                        }
//                        Spacer(minLength: 0)
//
//                        NavigationLink(destination: Verfication(loginData: loginData),
//                                       isActive: $loginData.gotoVerify) {
//                            Text("")
//                                .hidden()
//                        }
//                        Button(action: loginData.sendCode, label: {
//                            Text("繼續")
//                                .foregroundColor(.black)
//                                .padding(.vertical,18)
//                                .padding(.horizontal,38)
//                                .background(Color.yellow)
//                                .cornerRadius(15)
//                        })
//
//                        .disabled(loginData.phNo == "" ? true : false)
//                    }
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(15)
//
//                }
//                .frame(height: UIScreen.main.bounds.height / 1.8)
//                .background(Color.white)
//                .cornerRadius(20)
//
//                GeometryReader {reader in
//
//                    VStack {
//                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 15) {
//                            ForEach(rows, id: \.self) { value in
//                                Button(action: {buttonAction(value: value)}) {
//                                    ZStack{
//                                        if value == "delete.left" {
//
//                                            Image(systemName: value)
//                                                .font(.title)
//                                                .foregroundColor(.black)
//                                        }
//                                        else{
//                                            Text(value)
//                                                .font(.title)
//                                                .fontWeight(.bold)
//                                                .foregroundColor(.black)
//                                        }
//                                    }
//                                    .frame(
//                                        width: getWidth(frame: reader.frame(in: .global)),
//                                        height: getHeight(frame: reader.frame(in: .global))
//                                    )
//                                    .background(Color.white)
//                                    .cornerRadius(10)
//                                }
//                                .disabled(value == "" ? true : false)
//                            }
//                        }
//                    }
//                }
//            }
//            .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
//
//            if loginData.error {
//                AlertView(msg: loginData.errorMsg, show: $loginData.error)
//            }
//
//        }
//    }
//
//
//    func getWidth(frame: CGRect)->CGFloat {
//        let width = frame.width
//
//        let actualWidth = width - 40
//
//        return actualWidth / 3
//    }
//    func getHeight(frame: CGRect)->CGFloat {
//        let height = frame.height
//
//        let actualHeight = height - 40
//
//        return actualHeight / 4
//    }
//    func buttonAction(value: String) {
//        if value == "delete.left" && loginData.phNo != "" {
//            loginData.phNo.removeLast()
//        }
//        if value != "delete.left" {
//            loginData.phNo.append(value)
//        }
//
//    }
//
//
//}
//
//var rows = ["1","2","3","4","5","6","7","8","9","","0","delete.left"]
