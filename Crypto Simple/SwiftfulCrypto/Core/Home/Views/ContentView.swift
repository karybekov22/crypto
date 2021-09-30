//
//  ContentView.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 22/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: networkManager.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 200, height: 200)
                
                Text(networkManager.connectionDescription)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.accent)
                    .animation(.none)
                
                if !networkManager.isConnected {
                    Button {
                        print("Handle action...")
                    } label: {
                        CircleButtonView(iconName: "arrow.clockwise")
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
