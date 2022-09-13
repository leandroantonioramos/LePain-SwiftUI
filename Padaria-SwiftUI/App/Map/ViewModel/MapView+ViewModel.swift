import CoreLocation
import MapKit
import SwiftUI

extension MapView {
    final class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        @Published var mapView = MKMapView()
        @Published var region: MKCoordinateRegion!
        @Published var mapType: MKMapType = .standard
        @Published var permissionDenied = false
        
        func focusOnLocation()
        {
            guard let region = region else { return }
                        
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
            
            guard let region = region else { return }
            
            self.mapView.setRegion(region,
                                   animated: true)
            self.mapView.setVisibleMapRect(self.mapView.visibleMapRect,
                                           animated: true)
        }
    }
}
