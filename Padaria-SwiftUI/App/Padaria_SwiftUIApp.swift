import GoogleMaps
import GooglePlaces
import SwiftUI

@main
struct Padaria_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "completed") {
                NavigationView {
                    if UserDefaults.standard.bool(forKey: "saved") {
                        LandingPageView()
                    } else {
                        PerfilView(viewModel: PerfilView.ViewModel())
                            .navigationBarHidden(false)
                    }
                }
            } else {
                NavigationView {
                    ContentView(viewModel: PageView.ViewModel())
                }
            }
        }
    }
}
