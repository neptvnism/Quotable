import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case light, dark, sepia
    var id: String { self.rawValue }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .sepia:
            return nil  // Custom theme
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .light:
            return Color.white
        case .dark:
            return Color.black
        case .sepia:
            return Color(red: 244/255, green: 236/255, blue: 215/255)
        }
    }
    
    var textColor: Color {
        switch self {
        case .light, .sepia:
            return Color.black
        case .dark:
            return Color.white
        }
    }
    
    var buttonColor: Color {
        switch self {
        case .light, .sepia:
            return Color.blue
        case .dark:
            return Color.blue
        }
    }
}

struct SettingsView: View {
    @ObservedObject var viewModel: QuoteViewModel
    @Binding var theme: Theme
    @Binding var fontName: String
    @Binding var fontSize: Double
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")
                            .foregroundColor(theme.textColor)) {
                    Picker("Theme", selection: $theme) {
                        ForEach(Theme.allCases) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                    
                    Picker("Font", selection: $fontName) {
                        ForEach(["Arial", "Helvetica", "Times New Roman"], id: \.self) { font in
                            Text(font).tag(font)
                        }
                    }
                    
                    HStack {
                        Text("Font Size")
                        Slider(value: $fontSize, in: 12...24, step: 1)
                        Text("\(Int(fontSize))")
                    }
                }
                .foregroundColor(theme.textColor)
                
                Section(header: Text("Actions")
                            .foregroundColor(theme.textColor)) {
                    Button(action: {
                        viewModel.resetFavorites()
                    }) {
                        Text("Reset All Favorites")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Settings")
            .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))
            .foregroundColor(theme.textColor)
        }
        .preferredColorScheme(theme.colorScheme)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: QuoteViewModel(), theme: .constant(.light), fontName: .constant("Arial"), fontSize: .constant(16.0))
    }
}
