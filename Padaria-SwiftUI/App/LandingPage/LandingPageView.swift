import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            MapView()
                .navigationBarBackButtonHidden(true)
                .navigationTitle(UserPreferences.shared.hasUserName)
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
