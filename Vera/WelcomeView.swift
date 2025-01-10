//
//  WelcomeView.swift
//  Vera
//
//  Created by Jaideep Shah on 1/9/25.
//

import SwiftUI

class OT: ObservableObject {
    @Published var roomName: String = ""
}

struct WelcomeView: View {
    @StateObject private var ot = OT()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image("VonageLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 50)
                Spacer()
                Image("GitHubLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 30)
            }
            Text("Welcome to the")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Vonage Video App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            Text("Create a new room or join an existing one.")
                .font(.headline)
                .foregroundColor(.gray)
            
            Button(action: {
                // Action for creating a room
                print("Create room tapped")
            }) {
                HStack {
                    Image(systemName: "plus.viewfinder")
                    Text("Create room")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
            }
            
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                Text("or")
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Image(systemName: "keyboard")
                    .foregroundColor(.gray)
                TextField("Enter room name", text: $ot.roomName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Action for joining a room
                    print("Join room tapped with name: \(ot.roomName)")
                }) {
                    Text("Join")
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
