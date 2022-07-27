import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {    
    private let zoom: Float = 15.0
    
    func makeUIView(context: Self.Context) -> GMSMapView
    {
        let camera = GMSCameraPosition.camera(withLatitude: 0,
                                              longitude: 0,
                                              zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero,
                                     camera: camera)
        mapView.setMinZoom(14, maxZoom: 20)
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isIndoorEnabled = false

        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView,
                      context: Context)
    {
        
    }
}
