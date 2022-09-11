import Foundation
import Combine
import MapKit
import SwiftUI

struct LandingPageView: View {
    @StateObject var mapViewModel = MapView.ViewModel()
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        
        ZStack {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            MapView()
                .navigationBarBackButtonHidden(true)
                .environmentObject(mapViewModel)
                .navigationTitle(UserPreferences.shared.hasUserName)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                
                VStack(spacing: 0) {
                    
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Nome da padaria...",
                                  text: $mapViewModel.searchText)
                        .colorScheme(.light)
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    Spacer()
            
            }
                
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
        .onAppear {
            locationManager.delegate = mapViewModel
            locationManager.requestWhenInUseAuthorization()
        }
        .alert(isPresented: $mapViewModel.permissionDenied) {
            
            Alert(title: Text("Location services denied or restricted"),
                  message: Text("Please enable location in settings"),
                  dismissButton: .default(Text("Go to settings"),
                                          action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
            
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
