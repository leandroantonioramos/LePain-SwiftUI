import SwiftUI

extension LandingPageView {
    final class ViewModel: NSObject, ObservableObject {
        
        func goToSettingsApp()
        {
            let urlSettingsAppString = URL(string: UIApplication.openSettingsURLString)
            
            guard let urlSettingsAppString = urlSettingsAppString else {
                return
            }
            
            UIApplication.shared.open(urlSettingsAppString)
        }
    }
}
