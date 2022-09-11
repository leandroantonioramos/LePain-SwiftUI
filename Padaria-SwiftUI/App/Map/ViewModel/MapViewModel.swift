import CoreLocation
import MapKit
import SwiftUI

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapView = MKMapView()
    @Published var region: MKCoordinateRegion!
    @Published var mapType: MKMapType = .standard
    @Published var searchText = ""
    
    func focusOnLocation()
    {
        guard let region = region else {
            return
        }
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
}
