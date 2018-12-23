import UIKit
import CoreLocation

struct GlobalVariables {
    
    /*
     * DUMMY RESTAURANT / MEAL DATA
     */
    static var metroGrill = RestaurantMenuItem.init(restaurantName: "Metropolitan Grill",
                                                    restaurantDescription: "American Cuisine",
                                                    restaurantRating: 4,
                                                    restaurantLocation: CLLocationCoordinate2DMake(47.6166, -122.3123),
                                                    menuItemName: "Grilled Portobello Mignon",
                                                    menuItemPicture: UIImage(named: "grilled-portabello-dish"),
                                                    menuItemDescription: "Hern and garlic martinated portobello, asparagus spears, creamed spinach, and parmesan tomato crowns.",
                                                    menuItemPrice: "$20.99",
                                                    menuItemRedeemCode: "158-2149")
    
    static var edenHill = RestaurantMenuItem.init(restaurantName: "Eden Hill",
                                                  restaurantDescription: "American Cuisine",
                                                  restaurantRating: 3,
                                                  restaurantLocation: CLLocationCoordinate2DMake(47.6061, -122.3329),
                                                  menuItemName: "Cauliflower \"Chilaquiles\"",
                                                  menuItemPicture: UIImage(named: "cauliflower-dish"),
                                                  menuItemDescription: "A delightful meal with a spice of hispanic flair. Cauliflower and other vegies combine for a unique food experience.",
                                                  menuItemPrice: "$15.99",
                                                  menuItemRedeemCode: "190-3021")
    
    static var tavo = RestaurantMenuItem.init(restaurantName: "Tavolàta",
                                              restaurantDescription: "Fine Italian Cuisine",
                                              restaurantRating: 5,
                                              restaurantLocation: CLLocationCoordinate2DMake(47.6005, -122.3325),
                                              menuItemName: "Potato Gnocchi",
                                              menuItemPicture: UIImage(named: "gnocchi-dish"),
                                              menuItemDescription: "A traditional italian dish in a delicious marina sauce. The potatos arrive fresh daily. A staff favorite!",
                                              menuItemPrice: "$19.99",
                                              menuItemRedeemCode: "113-0750")
    
    static var sushi = RestaurantMenuItem.init(restaurantName: "Sushi Kashiba",
                                               restaurantDescription: "Japanese Cuisine",
                                               restaurantRating: 4,
                                               restaurantLocation: CLLocationCoordinate2DMake(47.6068, -122.3122),
                                               menuItemName: "Oysters on the Half Shell",
                                               menuItemPicture: UIImage(named: "oysters-dish"),
                                               menuItemDescription: "Delecate oysters delightfully served on the half shell. Oysters are seasonal, and brought in from Washington.",
                                               menuItemPrice: "$18.99",
                                               menuItemRedeemCode: "016-5545")
    
    static var lePichet = RestaurantMenuItem.init(restaurantName: "Le Pichet",
                                                  restaurantDescription: "French Cuisine",
                                                  restaurantRating: 4,
                                                  restaurantLocation: CLLocationCoordinate2DMake(47.6160, -122.3319),
                                                  menuItemName: "Gratin Lyonnais",
                                                  menuItemPicture: UIImage(named: "gratin-dish"),
                                                  menuItemDescription: "No description provided by restaurant.",
                                                  menuItemPrice: "$19.99",
                                                  menuItemRedeemCode: "256-4951")
    
    // To help build iterators over all of the restaurants
    static var restaurants = [metroGrill, edenHill, tavo, sushi, lePichet]
    
    // To tell the map where to zoom in to
    static var seattleLocation = CLLocationCoordinate2DMake(47.6062, -122.3321)
}
