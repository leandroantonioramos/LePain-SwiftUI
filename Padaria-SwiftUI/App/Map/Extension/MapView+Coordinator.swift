import MapKit
import SwiftUI

extension MapView: View {
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView])
        {
            if let annotationView = views.first {
                if let annotation = annotationView.annotation {
                    if annotation is MKUserLocation {
                        let region = MKCoordinateRegion(center: annotation.coordinate,
                                                        latitudinalMeters: 1000,
                                                        longitudinalMeters: 1000)
                        mapView.setRegion(region, animated: true)
                    }
                }
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
        {
            guard let coordinates = view.annotation?.coordinate else { return }
            let span = mapView.region.span
            let region = MKCoordinateRegion(center: coordinates, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}
