import SwiftUI

@main
struct Padaria_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "completed") {
                NavigationView {
                    if UserDefaults.standard.bool(forKey: "saved") {
                        Text("Open the with a map on it")
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                    } else {
                        PerfilView(viewModel: PerfilView.ViewModel())
                    }
                }
            } else {
                ContentView(viewModel: PageView.ViewModel())
            }
        }
    }
}
