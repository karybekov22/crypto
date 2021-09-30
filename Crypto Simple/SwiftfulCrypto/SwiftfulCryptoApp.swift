//
//  SwiftfulCryptoApp.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 22/9/21.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @ObservedObject var networkManager = NetworkManager()
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
//        WindowGroup {
//            ZStack {
//                NavigationView {
//                    HomeView()
//                        .navigationBarHidden(true)
//                }
//                .navigationViewStyle(StackNavigationViewStyle())
//                .environmentObject(vm)
//
//                ZStack {
//                    if showLaunchView {
//                        LaunchView(showLaunchView: $showLaunchView)
//                            .transition(.move(edge: .leading))
//                    }
//                }
//                .zIndex(2.0)
//            }
//        }
        
        WindowGroup {
            if networkManager.isConnected {
                ZStack {
                    NavigationView {
                        HomeView()
                            .navigationBarHidden(true)
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .environmentObject(vm)

                    ZStack {
                        if showLaunchView {
                            LaunchView(showLaunchView: $showLaunchView)
                                .transition(.move(edge: .leading))
                        }
                    }
                    .zIndex(2.0)
                }
            } else {
                ContentView()
            }
        }
    }
}
