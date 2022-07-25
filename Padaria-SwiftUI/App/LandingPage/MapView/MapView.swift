import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {
    private let zoom: Float = 15.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 51.507,
                                              longitude: 0, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero,
                                     camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
    }
}
