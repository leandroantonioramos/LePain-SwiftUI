import Foundation
import Combine
import MapKit
import SwiftUI

struct LandingPageView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var landingPageViewModel = LandingPageView.ViewModel()
    @StateObject var mapViewModel = MapView.ViewModel()
    
    @State var locationManager = CLLocationManager()
    @State var selectedPlace: MapViewLandmarkAnnotation?
    
    var body: some View {
        
        ZStack {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            MapView() { _ in
            }
            .navigationBarBackButtonHidden(true)
            .environmentObject(mapViewModel)
            .navigationBarTitle(UserPreferences.shared.hasUserName, displayMode: .large)
            .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                
                HStack {
                    if #available(iOS 15.0, *) {
                        TextField("Search ...", text: $mapViewModel.searchText)
                            .textFieldStyle(.roundedBorder)
                            .onSubmit {
                                mapViewModel.getNearbyLandmarks(landmarkName: mapViewModel.searchText)
                            }
                    } else {
                        TextField("Search ...", text: $mapViewModel.searchText)
                            .keyboardType(.twitter)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Continue") {
                            mapViewModel.getNearbyLandmarks(landmarkName: mapViewModel.searchText)
                            UIApplication.shared.endEditing()
                        }
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                }
                .padding()
                .background(Color("background"))
                
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
                .padding(.bottom, 30)
                .padding(.trailing)
                
            }
        }
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
    }
    
    struct LandingPageView_Previews: PreviewProvider {
        static var previews: some View {
            LandingPageView()
        }
    }
}
