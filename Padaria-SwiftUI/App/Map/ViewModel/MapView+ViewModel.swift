import CoreLocation
import MapKit
import SwiftUI

extension MapView {
    final class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        @Published var mapView = MKMapView()
        @Published var region: MKCoordinateRegion!
        @Published var mapType: MKMapType = .standard
        @Published var searchText = ""
        @Published var permissionDenied = false
        
        func focusOnLocation()
        {
            guard let _ = region else { return }
                        
            mapView.setRegion(region, animated: true)
            mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
        {
            switch manager.authorizationStatus {
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            case .restricted:
                permissionDenied.toggle()
            case .denied:
                permissionDenied.toggle()
            case .authorizedAlways:
                manager.requestLocation()
            case .authorizedWhenInUse:
                manager.requestLocation()
            @unknown default:
                ()
            }
        }
        
        func locationManager(_ manager: CLLocationManager,
                             didFailWithError error: Error)
        {
            print(error.localizedDescription)
        }
        
        func locationManager(_ manager: CLLocationManager,
                             didUpdateLocations locations: [CLLocation])
        {
            guard let location = locations.last else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate,
                                             latitudinalMeters: 1000,
                                             longitudinalMeters: 1000)
            
            self.mapView.setRegion(self.region,
                                   animated: true)
            self.mapView.setVisibleMapRect(self.mapView.visibleMapRect,
                                           animated: true)
        }
    }
}
