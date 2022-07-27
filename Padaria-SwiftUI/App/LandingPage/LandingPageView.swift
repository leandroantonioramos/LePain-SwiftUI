import SwiftUI

struct LandingPageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var selection = 1
    
    var body: some View {
        ZStack {
            VStack {
                MapView()
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle(Text(UserPreferences.shared.hasUserName))
            }
        }
    }
}


struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
            .previewDevice("iPhone SE")
            .environment(\.colorScheme, .dark)
        LandingPageView()
            .previewDevice("iPhone SE")
            .environment(\.colorScheme, .light)
    }
}
