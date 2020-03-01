import UIKit
import GoogleMaps
import MapKit

class VacationDestination: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
    
}

class MyGoogle: UIViewController {
    
    var mapView: GMSMapView?
    
    var currentDestination: VacationDestination?
    
    let destinations = [VacationDestination(name: "All Country Recycling", location: CLLocationCoordinate2DMake(40.244312, -74.733866), zoom: 14), VacationDestination(name: "Vinch Recycling", location: CLLocationCoordinate2DMake(40.2438966, -74.760403), zoom: 18)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCTMxA6REK9u89EwZrpIzExE3Ntb2J65WM")
        let camera = GMSCameraPosition.camera(withLatitude: 40.2684, longitude: -74.7777, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(40.2684, -74.7777)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "TCNJ"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: "next")
    }
    
    func next() {
        
        if currentDestination == nil {
            currentDestination = destinations.first
        } else {
            if let index = destinations.firstIndex(of: currentDestination!), index < destinations.count - 1 {
            currentDestination = destinations[index + 1]
            }
        }
        
        setMapCamera()
    }
    
    private func setMapCamera() {
        CATransaction.begin()
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom))
        CATransaction.commit()
        
        let marker = GMSMarker(position: currentDestination!.location)
        marker.title = currentDestination?.name
        marker.map = mapView
    }

}
