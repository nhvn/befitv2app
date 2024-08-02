import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Replace with real data and functionalities
            Form {
                Section(header: Text("Personal Information")) {
                    Text("Name: Alan Nhan")
                    Text("Email: alan@example.com")
                }
                
                Section(header: Text("Settings")) {
                    Toggle("Enable Notifications", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            
            Spacer()
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
