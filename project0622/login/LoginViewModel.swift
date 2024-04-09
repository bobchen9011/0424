//
//  LoginViewModel.swift
//  project0622
//
//  Created by bbob on 2023/9/18.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var phNo = ""
    @Published var gotoVerify = false 
}

