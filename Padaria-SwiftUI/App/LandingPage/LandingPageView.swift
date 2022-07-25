import SwiftUI

struct LandingPageView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 400)
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(true)
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
