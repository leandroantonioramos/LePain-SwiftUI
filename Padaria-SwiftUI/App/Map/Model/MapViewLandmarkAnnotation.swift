import MapKit
import UIKit

final class MapViewLandmarkAnnotation: NSObject, MKAnnotation {
    let name: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: MapViewLandmark)
    {
        self.name = landmark.name
        self.coordinate = landmark.coordinate
    }
}
