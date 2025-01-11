import SwiftUI

class OT: ObservableObject {
    @Published var roomName: String = ""
}

struct WelcomeView: View {
    @StateObject private var ot = OT()
    @State private var isJoinEnabled = false
    @State private var navigateToJoin = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image("VonageLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 50)
                    Spacer()
                    Button(action: {
                        if let url = URL(string: "https://github.com/opentok/vera-ios-app") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image("GitHubLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 30)
                    }
                }
                
                Text(LocalizedStringKey("WELCOME_MESSAGE"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(LocalizedStringKey("VONAGE_VIDEO_APP"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(LocalizedStringKey("INSTRUCTION_TEXT"))
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Action for creating a room
                    print("Create room tapped")
                }) {
                    CreateRoomButtonView()
                }
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text(LocalizedStringKey("OR_SEPARATOR"))
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image(systemName: "keyboard")
                        .foregroundColor(.gray)
                    TextField(LocalizedStringKey("ENTER_ROOM_NAME_PLACEHOLDER"), text: $ot.roomName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: ot.roomName) { oldValue, newValue in
                            let filteredName = newValue.filter { $0.isLetter || $0.isNumber }
                            if filteredName != newValue {
                                ot.roomName = filteredName
                            }
                            isJoinEnabled = !filteredName.isEmpty
                        }
                    Button(action: {
                        // Navigate to PrepareToJoinView only when the button is pressed
                        if isJoinEnabled {
                            navigateToJoin = true
                        }
                    }) {
                        Text(LocalizedStringKey("JOIN_BUTTON"))
                            .foregroundColor(.blue)
                    }
                    .disabled(!isJoinEnabled)
                }
                NavigationLink(destination: PrepareToJoinView(roomName: ot.roomName), isActive: $navigateToJoin) {
                    EmptyView()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct CreateRoomButtonView: View {
    var body: some View {
        Button(action: {
            // Your action here
        }) {
            HStack {
                ZStack {
                    Image(systemName: "video")
                        .foregroundColor(.white)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 10)) // Adjust size to fit within the video icon
                }
                Text(LocalizedStringKey("CREATE_ROOM_BUTTON"))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 2)
            )
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
