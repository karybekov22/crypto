//
//  CryptoApp.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 22/9/21.
//

import SwiftUI

@main
struct CryptoApp: App {
    @ObservedObject var networkManager = NetworkManager()
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            if networkManager.isConnected {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .environmentObject(vm)
            } else {
                ContentView()
            }
            
        }
    }
}
