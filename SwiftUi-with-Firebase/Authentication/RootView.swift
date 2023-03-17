//
//  RootView.swift
//  SwiftUi-with-Firebase
//
//  Created by Hakan Gül on 17.03.2023.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                Text("Settings")
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}