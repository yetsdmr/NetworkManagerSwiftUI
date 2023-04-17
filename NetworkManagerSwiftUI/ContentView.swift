//
//  ContentView.swift
//  NetworkManagerSwiftUI
//
//  Created by Yunus Emre Taşdemir on 17.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        Group {
            if networkManager.isConnected {
                // show main content
            } else {
                // show failed internet screen
            }
        }
        
        ZStack {
            Color(.systemBlue).ignoresSafeArea()
            
            VStack {
                Image(systemName: networkManager.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                
                Text(networkManager.connectionDescription)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                
                if !networkManager.isConnected {
                    Button {
                        print("Handle action..")
                    } label: {
                        Text("Rety")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: 140)
                    .background(.white)
                    .clipShape(Capsule())
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
