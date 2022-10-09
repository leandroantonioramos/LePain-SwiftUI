import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapViewModel: MapView.ViewModel
    
    func makeUIView(context: Context) -> some MKMapView
    {
        let view = mapViewModel.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        view.isZoomEnabled = false
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context)
    {
        updateAnnotattions(from: uiView)
    }

    func makeCoordinator() -> Coordinator
    {
        return MapView.Coordinator()
    }
    
    private func updateAnnotattions(from mapView: MKMapView)
    {
        mapView.removeAnnotations(mapView.annotations)
        
        let annotations = self.mapViewModel.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
