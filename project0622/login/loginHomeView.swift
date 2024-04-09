//
//  loginHomeView.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/13.
//

import SwiftUI

struct loginHomeView: View {
    @State private var isUserCurrentlyLoggedOut: Bool = false
    var body: some View {
        NavigationView {
            if self.isUserCurrentlyLoggedOut {
                loginHomeView()
            }
            else {
                LoginView()
            }
        }
    }
}

struct loginHomeView_Previews: PreviewProvider {
    static var previews: some View {
        loginHomeView()
    }
}
