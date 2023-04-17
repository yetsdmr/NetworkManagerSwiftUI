//
//  NetworkManager.swift
//  NetworkManagerSwiftUI
//
//  Created by Yunus Emre Taşdemir on 17.04.2023.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    
    @Published var isConnected = true
    
    var image : String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    
    var connectionDescription : String {
        if isConnected {
            return "Internet connection looks good!"
        } else {
            return "It look like you're not connected to the internet"
        }
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
