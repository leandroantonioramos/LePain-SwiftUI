import Foundation
import Combine
import MapKit
import SwiftUI

struct LandingPageView: View {
    @StateObject var landingPageViewModel = LandingPageView.ViewModel()
    @StateObject var mapViewModel = MapView.ViewModel()
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        
        if #available(iOS 15.0, *) {
            ZStack {
                
                Color("background").edgesIgnoringSafeArea(.all)
                
                MapView()
                    .navigationBarBackButtonHidden(true)
                    .environmentObject(mapViewModel)
                    .navigationBarTitle(UserPreferences.shared.hasUserName, displayMode: .large)
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        
                        Button(action: mapViewModel.focusOnLocation,
                               label: {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(10)
                                .background(Color.secondary)
                                .clipShape(Circle())
                        })
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .trailing)
                    .padding()
                    .padding(.bottom, 10)
                    
                }
            }
            .searchable(text: $landingPageViewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("sei lá"))
            .onAppear {
                locationManager.delegate = mapViewModel
                locationManager.requestWhenInUseAuthorization()
            }
            .alert(isPresented: $mapViewModel.permissionDenied) {
                
                Alert(title: Text("Location services denied or restricted"),
                      message: Text("Please enable location in settings"),
                      dismissButton: .default(Text("Go to settings"),
                                              action: landingPageViewModel.goToSettingsApp))
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
