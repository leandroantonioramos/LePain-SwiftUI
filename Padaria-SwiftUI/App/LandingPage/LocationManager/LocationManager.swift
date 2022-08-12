import CoreLocation

//class LocationManager: NSObject, ObservableObject {
//    private let locationManager = CLLocationManager()
//    @Published var locationStatus: CLAuthorizationStatus?
//    @Published var lastLocation: CLLocation?
//
//    override init()
//    {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//    var locationStatusString: String {
//        guard let status = locationStatus else {
//            return "unknown"
//        }
//
//        switch status {
//        case .notDetermined:
//            return "not determined"
//        case .restricted:
//            return "restricted"
//        case .denied:
//            return "denied"
//        case .authorizedAlways:
//            return "always"
//        case .authorizedWhenInUse:
//            return "when in use"
//        case .authorized:
//            return "autorized"
//        default:
//            return "unknown"
//        }
//    }
//}
//
//extension LocationManager: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
//    {
//
//    }
//
//    func locationManager(_ manager: CLLocationManager,
//                         didUpdateLocations locations: [CLLocation])
//    {
//        guard let location = locations.last else { return }
//        lastLocation = location
//    }
//}
class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {

    // Publish the user's location so subscribers can react to updates
    @Published var lastKnownLocation: CLLocation? = nil
    private let manager = CLLocationManager()

    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status == .authorizedWhenInUse {
            self.manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Notify listeners that the user has a new location
        self.lastKnownLocation = locations.last
    }
}
