import UIKit
import Material
import SnapKit

class FindViewController: UIViewController {
    let topbar = UIView()
    let diningPassLabel = UILabel()
    
    let searchBox = TextField()
    let searchNearbyButton = RaisedButton(title: "Nearby Search", titleColor: .black)

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.red.darken1
        
        prepareTabItem()
        prepareDiningPassLabel()
        prepareSearchBox()
        prepareNearbySearchButton()
    }
}

extension FindViewController {
    fileprivate func prepareTabItem() {
        tabItem.title = "Find"
        tabItem.image = Icon.place
    }
    
    fileprivate func prepareDiningPassLabel() {
        diningPassLabel.text = "Dining Pass"
        diningPassLabel.font = UIFont(name: "Helvetica", size: 54);
        diningPassLabel.textColor = Color.white
        self.view.addSubview(diningPassLabel)
        
        diningPassLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY).offset(-180)
        }
    }
    
    fileprivate func prepareSearchBox() {
        searchBox.placeholder = " Search..."
        searchBox.isClearIconButtonEnabled = true
        searchBox.isPlaceholderUppercasedWhenEditing = true
        searchBox.placeholderAnimation = .hidden
        searchBox.dividerActiveColor = Color.white
        searchBox.textColor = Color.black
        searchBox.backgroundColor = Color.white
        self.view.addSubview(searchBox)
        
        searchBox.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).offset(-40)
            make.height.equalTo(50)
            make.centerY.equalTo(self.view.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    fileprivate func prepareNearbySearchButton() {
        searchNearbyButton.pulseColor = .red
        searchNearbyButton.backgroundColor = Color.white
        searchNearbyButton.addTarget(self, action: #selector(searchNearby), for: .touchUpInside)
        self.view.addSubview(searchNearbyButton)
        
        searchNearbyButton.snp.makeConstraints { (make) in
            make.width.equalTo(searchBox.snp.width)
            make.height.equalTo(50)
            make.centerY.equalTo(self.view.snp.centerY).offset(75)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    @objc fileprivate func searchNearby(sender: UIButton!) {
        present(SearchResultsViewController(), animated: true, completion: nil)
    }
}
