import Foundation
import Combine
import MapKit
import SwiftUI

struct LandingPageView: View {
    @StateObject var mapViewModel = MapViewModel()
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            MapView()
                .navigationBarBackButtonHidden(true)
                .environmentObject(mapViewModel)
                .navigationTitle(UserPreferences.shared.hasUserName)
                .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            locationManager.delegate = mapViewModel
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
