import CoreLocation
 
class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        requestLocationUpdate()
        requestLocation()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func requestLocationUpdate(){
        manager.startUpdatingLocation()
    }
    
    func stopLocationUpdate(){
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
