//
//  productFeaturesView2.swift
//  go
//
//  Created by e530 on 2022/12/26.
//

import SwiftUI
import RiveRuntime

struct productFeaturesView2: View {
    @Environment (\.presentationMode) var mode
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State var count : Int = 0
    @State private var onOff = false
    var body: some View {
        
        ScrollView {
            VStack {
                Button {
                    self.onOff.toggle()
                } label: {
                        HStack {
                            Spacer()
                            VStack {
                                Image("start")
                                Text("開/關")
                                    .foregroundColor(Color.black)
                                    .font(.title)
                            }
                            Text(onOff ? "開" : "關")
                                .font(.largeTitle)
                                .foregroundColor(Color.green)
                            Spacer()
                        }
                        Spacer()
                }
                HStack {
                    Rectangle().frame(height: 1).opacity(0.1)
                }
                
                Button {
                    showAlert = true
                    alertTitle = ("開起脈衝夾柔按摩！")
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            Image("massage2")
                        }
                        Spacer()
                        Text("脈衝夾柔按摩模式")
                            .foregroundColor(Color.black)
                            .font(.title)
                    }
                }.alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("OK") { }
                })
                HStack {
                    Rectangle().frame(height: 1).opacity(0.1)
                }
                Button {
                    showAlert = true
                    alertTitle = ("開起熱敷模式！")
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            Image("heating2")
                        }
                        Spacer()
                        Text("熱敷模式")
                            .foregroundColor(Color.black)
                            .font(.title)
                    }
                }.alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("OK") { }
                })
                
            }.padding(30)
                .background(.regularMaterial)
    }
            .navigationTitle("產品功能")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                Text("按摩帶介紹")
                    .foregroundColor(.blue)
            }))
    }
}


struct productFeaturesView2_Previews: PreviewProvider {
    static var previews: some View {
        productFeaturesView2()
    }
}
