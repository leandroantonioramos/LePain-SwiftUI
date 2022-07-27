import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    @Published var lastKnowLocation: CLLocation? = nil
    
    private let manager = CLLocationManager()
    
    override init()
    {
        super.init()
        self.manager.delegate = self
        self.manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status == .authorizedWhenInUse {
            self.manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        self.lastKnowLocation = locations.last
    }
}
