import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapViewModel: MapViewModel
    
    func makeUIView(context: Context) -> some UIView
    {
        let view = mapViewModel.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context)
    {
        
    }

    func makeCoordinator() -> Coordinator
    {
        return MapView.Coordinator()
    }
}

extension MapView {
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
    }
}
