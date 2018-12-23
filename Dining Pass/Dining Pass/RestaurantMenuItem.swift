import UIKit
import CoreLocation

// Hold on to a menu item / restaurant information
struct RestaurantMenuItem {
    // Restaurant Info
    let restaurantName: String
    let restaurantDescription: String
    let restaurantRating: Double
    let restaurantLocation: CLLocationCoordinate2D
    
    // Menu Item Info
    let menuItemName: String
    let menuItemPicture: UIImage?
    let menuItemDescription: String
    let menuItemPrice: String
    let menuItemRedeemCode: String
}
