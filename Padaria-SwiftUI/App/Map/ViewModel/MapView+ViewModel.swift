import CoreLocation
import MapKit
import SwiftUI

extension MapView {
    final class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        private let locationManager = CLLocationManager()
        
        @Published var mapView = MKMapView()
        @Published var region: MKCoordinateRegion?
        @Published var permissionDenied = false
        @Published var searchText = ""
        
        @Published var landmarks: [Landmark] = [Landmark]()
        
        var latitude: Double {
            return locationManager.location?.coordinate.latitude ?? 0
        }
        
        var longitude: Double {
            return locationManager.location?.coordinate.longitude ?? 0
        }
        
        func getNearbyLandmarks(landmarkName: String)
        {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = landmarkName
            
            let search = MKLocalSearch(request: request)
            search.start { response, error in
                if let response = response {
                    let mapItems = response.mapItems
                    self.landmarks = mapItems.map {
                        Landmark(placemark: $0.placemark)
                    }
                }
            }
        }
        
        func focusOnLocation()
        {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude,
                                                                           longitude: longitude),
                                            latitudinalMeters: 1000,
                                            longitudinalMeters: 1000)
            
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
            guard let location = locations.first else {
                return
            }
            
            region = MKCoordinateRegion(center: location.coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
            
            guard let region = region else { return }
            
            mapView.setRegion(region, animated: true)
            mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        }
    }
}
