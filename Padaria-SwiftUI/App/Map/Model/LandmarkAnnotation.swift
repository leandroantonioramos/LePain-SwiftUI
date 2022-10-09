import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let name: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark)
    {
        self.name = landmark.name
        self.coordinate = landmark.coordinate
    }
}
