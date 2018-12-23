import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation {
    let restaurantName: String?
    let desc: String
    let coordinate: CLLocationCoordinate2D
    
    init(restaurantName: String, description: String, coordinate: CLLocationCoordinate2D) {
        self.restaurantName = restaurantName
        self.desc = description
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return restaurantName
    }
}
