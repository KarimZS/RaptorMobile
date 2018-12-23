import UIKit
import Material
import SnapKit
import MapKit

class SearchResultsViewController: UIViewController {
    let topbar = UIView()
    let diningPassLabel = UILabel()
    let map = MKMapView()
    let table = UIScrollView()
    let backButton = UIButton()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Prepare top bar
        prepareTopBar()
        prepareDiningPassLabel()
        prepareBackButton()
        
        // Prepare map / search results
        prepareMap();
        prepareTable();
    }
}

extension SearchResultsViewController {
    fileprivate func prepareTopBar() {
        topbar.backgroundColor = Color.red.darken1
        self.view.addSubview(topbar)
        
        topbar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(60)
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
        }
    }
    
    fileprivate func prepareDiningPassLabel() {
        diningPassLabel.text = "Dining Pass"
        diningPassLabel.font = UIFont(name: "Helvetica", size: 22);
        diningPassLabel.textColor = Color.white
        topbar.addSubview(diningPassLabel)
        
        diningPassLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topbar.snp.centerX)
            make.centerY.equalTo(topbar.snp.centerY).offset(5)
        }
    }
    
    fileprivate func prepareBackButton() {
        backButton.setImage(Icon.arrowBack, for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        topbar.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalTo(topbar.snp.left).offset(10)
            make.top.equalTo(topbar.snp.top).offset(15)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    fileprivate func prepareMap() {
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(GlobalVariables.seattleLocation, span)
        self.map.setRegion(region, animated: true)
        
        GlobalVariables.restaurants.forEach { (menuItem) in
            map.addAnnotation(RestaurantAnnotation(restaurantName: menuItem.restaurantName,
                                                   description: menuItem.restaurantDescription,
                                                   coordinate: menuItem.restaurantLocation))
        }
        
        
        
        
        
        self.view.addSubview(map)
        
        map.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).offset(-40)
            make.height.equalTo(map.snp.width)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(topbar.snp.bottom).offset(20)
        }
    }
    
    fileprivate func prepareTable() {
        table.backgroundColor = Color.grey.lighten3
        let width = self.view.frame.width - 40
        let height = CGFloat(550)
        table.contentSize = CGSize(width: width, height: height)
        self.view.addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.width.equalTo(map.snp.width)
            make.top.equalTo(map.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.left.equalTo(map.snp.left)
        }
        
        prepareTableEntries()
    }

    fileprivate func prepareTableEntries() {
        prepareTableEntry(menuItem: GlobalVariables.metroGrill, offset: 10, action: #selector(goToDetailsOne))
        prepareTableEntry(menuItem: GlobalVariables.edenHill, offset: 120, action: #selector(goToDetailsTwo))
        prepareTableEntry(menuItem: GlobalVariables.tavo, offset: 230, action: #selector(goToDetailsThree))
        prepareTableEntry(menuItem: GlobalVariables.sushi, offset: 340, action: #selector(goToDetailsFour))
        prepareTableEntry(menuItem: GlobalVariables.lePichet, offset: 450, action: #selector(goToDetailsFive))
    }
    
    fileprivate func prepareTableEntry(menuItem: RestaurantMenuItem,
                                       offset: Int,
                                       action: Selector) {
        let entryBackground = MealListItemView(menuItem: menuItem, showDetails: true)
        entryBackground.button.addTarget(self, action: action, for: .touchUpInside)
        table.addSubview(entryBackground)
        
        entryBackground.snp.makeConstraints { (make) in
            make.width.equalTo(table.snp.width).offset(-20)
            make.centerX.equalTo(table.snp.centerX)
            make.height.equalTo(100)
            make.top.equalTo(table.snp.bottom).offset(offset)
        }
    }
}

// Manage the navigation
extension SearchResultsViewController {
    @objc fileprivate func goBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func goToDetailsOne(sender: UIButton!) {
        present(MealDetailsViewController(menuItem: GlobalVariables.metroGrill),
                animated: true,
                completion: nil)
    }
    
    @objc fileprivate func goToDetailsTwo(sender: UIButton!) {
        present(MealDetailsViewController(menuItem: GlobalVariables.edenHill),
                animated: true,
                completion: nil)
    }
    
    @objc fileprivate func goToDetailsThree(sender: UIButton!) {
        present(MealDetailsViewController(menuItem: GlobalVariables.tavo),
                animated: true,
                completion: nil)
    }
    
    @objc fileprivate func goToDetailsFour(sender: UIButton!) {
        present(MealDetailsViewController(menuItem: GlobalVariables.sushi),
                animated: true,
                completion: nil)
    }
    
    @objc fileprivate func goToDetailsFive(sender: UIButton!) {
        present(MealDetailsViewController(menuItem: GlobalVariables.lePichet),
                animated: true,
                completion: nil)
    }
}
