//
//  productSeclectView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//
//產品類別選擇單

import SwiftUI

struct productSeclectView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: productView()) {
                    HStack {
                        Image("800x (3)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Spacer()
                        Text("按摩槍")
                            .foregroundColor(.primary)
                            .font(.headline)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                NavigationLink(destination: productView2()) {
                    HStack {
                        Image("無線筋舒福夾揉按摩帶")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                                   )
                        Spacer()
                        Text("按摩頸枕")
                            .foregroundColor(.primary)
                            .font(.headline)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                
                NavigationLink(destination: historyView()) {
                    HStack {
                        Image("8")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Spacer()
                        Text("按摩椅")
                            .foregroundColor(.primary)
                            .font(.headline)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
                
                NavigationLink(destination: historyView()) {
                    HStack {
                        Image("5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Spacer()
                        Text("按摩枕")
                            .foregroundColor(.primary)
                            .font(.headline)
                            .padding(.leading, 10)
                        Spacer()
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .cornerRadius(10            )
            .padding(.horizontal)
            .padding(.vertical, 10)
            .shadow(radius: 5)
            
            Spacer()
            
            
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        .navigationTitle("產品類別選單")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("回主頁")
                    .foregroundColor(.blue)
            }
        }))
    }
}

struct productSeclectView_Previews: PreviewProvider {
    static var previews: some View {
        productSeclectView()
    }
}
