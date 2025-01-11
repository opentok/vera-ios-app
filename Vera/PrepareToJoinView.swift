//
//  PrepareToJoinView.swift
//  Vera
//
//  Created by Jaideep Shah on 1/10/25.
//

import SwiftUI

struct PrepareToJoinView: View {
    var roomName: String
    
    var body: some View {
        VStack {
            Text("Preparing to join room: \(roomName)")
            // Add your logic here for joining the room
        }
    }
}
