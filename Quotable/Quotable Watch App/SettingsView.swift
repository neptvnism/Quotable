import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Settings")) {
                    Toggle("Option 1", isOn: .constant(true))
                    Toggle("Option 2", isOn: .constant(false))
                }
                
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Profile")) {
                        Text("Profile")
                    }
                    NavigationLink(destination: Text("Notifications")) {
                        Text("Notifications")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
