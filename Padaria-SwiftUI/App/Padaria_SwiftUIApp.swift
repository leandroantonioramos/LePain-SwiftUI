import SwiftUI

@main
struct Padaria_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "completed") {
                NavigationView {
                    PerfilView(viewModel: PerfilView.ViewModel())
                }
            } else {
                ContentView(viewModel: PageViewModel())
            }
        }
    }
}
