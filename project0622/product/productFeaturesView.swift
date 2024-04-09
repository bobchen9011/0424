//
//  productFeaturesView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//

import SwiftUI
import RiveRuntime

struct productFeaturesView: View {
    @Environment (\.presentationMode) var mode
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State var count1 : Int = 0
    @State var count2 : Int = 0
    @State var count3 : Int = 0
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
                    self.count2 = 0
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            Button {
                                self.count2-=1
                                if count2 <= 0 {
                                    count2 = 0
                                }
                            } label: {
                                Image("minus")
                            }
                            Image("massage")
                            Button {
                                self.count2+=1
                                if count2 >= 12 {
                                    count2 = 12
                                }
                            } label: {
                                Image("plus")
                            }
                            Text("\(count2)")
                                .font(.largeTitle)
                                .foregroundColor(Color.green)
                        }
                        Spacer()
                        Text("震動模式")
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
                    self.count3 = 0
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            Button {
                                self.count3-=1
                                if count3 <= 0 {
                                    count3 = 0
                                }
                            } label: {
                                Image("minus")
                            }
                            Image("heating")
                            Button {
                                self.count3+=1
                                if count3 >= 3 {
                                    count3 = 3
                                }
                            } label: {
                                Image("plus")
                            }
                            Text("\(count3)")
                                .font(.largeTitle)
                                .foregroundColor(Color.green)
                        }
                        Spacer()
                        Text("熱敷模式")
                            .foregroundColor(Color.black)
                            .font(.title)
                    }
                }
                
            }.padding(30)
                .background(.regularMaterial)
    }
            .navigationTitle("產品功能")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                Text("按摩槍介紹")
                    .foregroundColor(.blue)
            }))
    }
}

struct productFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        productFeaturesView()
    }
}
