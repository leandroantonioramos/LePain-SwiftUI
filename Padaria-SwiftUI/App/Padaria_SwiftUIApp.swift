import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

    return true
  }
}

@main
struct Padaria_SwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
