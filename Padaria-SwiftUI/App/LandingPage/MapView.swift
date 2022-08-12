import Combine
import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {

    @ObservedObject var locationManager = LocationManager()

    func makeUIView(context: Self.Context) -> GMSMapView
    {

        let camera = GMSCameraPosition.camera(withLatitude: 0,
                                              longitude: 0,
                                              zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero,
                                     camera: camera)
        mapView.setMinZoom(14, maxZoom: 20)
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isIndoorEnabled = false

        return mapView
    }

    func updateUIView(_ mapView: GMSMapView,
                      context: Self.Context)
    {
        if let myLocation = locationManager.lastKnownLocation {
            mapView.animate(toLocation: myLocation.coordinate)
        }
    }
}
