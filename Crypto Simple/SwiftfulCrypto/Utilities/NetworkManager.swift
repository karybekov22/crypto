//
//  NetworkManager.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 29/9/21.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    var connectionDescription: String {
        if isConnected {
            return "Internet Connection looks good"
        } else {
            return "It look like you're not connected to the internet. Please, get connected and relaunch the app."
        }
    }
    
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
}
