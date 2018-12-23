import UIKit
import Material
import SnapKit

// Class defines a view controller for viewing
// meal information
class MealViewController: UIViewController {
    // The menu item being represented
    let menuItem: RestaurantMenuItem
    
    // Dining Pass Design / Navigation Elements
    let topbar = UIView()
    let diningPassLabel = UILabel()
    let scrollView = UIScrollView()
    let backButton = UIButton()
    
    // Restaurant / Menu Item Elements
    let restaurantName = UILabel()
    let subtitle = UILabel()
    let line = UIView()
    let mealName = UILabel()
    var mealImage = UIView()
    let mealDesc = UILabel()
    
    // Initalizers / View Preparation
    init(menuItem: RestaurantMenuItem) {
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Setup top bar / navigation
        prepareTopBar()
        prepareDiningPassLabel()
        prepareBackButton()
        
        // Setup restaurant / meal information
        prepareScrollView()
        prepareRestaurantName()
        prepareSubtitle()
        prepareLine()
        prepareMealName()
        prepareMealImage()
        prepareMealDesc()
    }
}

// Manage all setup functions - which each
// prepare a different element of the view.
extension MealViewController {
    func prepareTopBar() {
        topbar.backgroundColor = Color.red.darken1
        self.view.addSubview(topbar)
        
        topbar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(60)
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
        }
    }
    
    func prepareDiningPassLabel() {
        diningPassLabel.text = "Dining Pass"
        diningPassLabel.font = UIFont(name: "Helvetica", size: 22);
        diningPassLabel.textColor = Color.white
        topbar.addSubview(diningPassLabel)
        
        diningPassLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topbar.snp.centerX)
            make.centerY.equalTo(topbar.snp.centerY).offset(5)
        }
    }
    
    func prepareBackButton() {
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
    
    func prepareScrollView() {
        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.top.equalTo(topbar.snp.bottom)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    func prepareRestaurantName() {
        restaurantName.text = menuItem.restaurantName
        restaurantName.font = UIFont(name: "Helvetica", size: 36);
        restaurantName.textColor = Color.grey.darken2
        scrollView.addSubview(restaurantName)
        
        restaurantName.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(scrollView.snp.top).offset(40)
        }
    }
    
    func prepareSubtitle() {
        subtitle.text = menuItem.restaurantDescription
        subtitle.font = UIFont(name: "Helvetica", size: 20);
        subtitle.textColor = Color.grey.base
        scrollView.addSubview(subtitle)
        
        subtitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(restaurantName.snp.bottom).offset(10)
        }
    }
    
    func prepareLine() {
        line.backgroundColor = Color.grey.darken2
        scrollView.addSubview(line)
        
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.width.equalTo(scrollView.snp.width).offset(-40)
            make.top.equalTo(subtitle.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
    }
    
    func prepareMealName() {
        mealName.text = menuItem.menuItemName
        mealName.font = UIFont(name: "Helvetica-Bold", size: 30);
        mealName.textColor = Color.grey.darken4
        scrollView.addSubview(mealName)
        
        mealName.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView.snp.left).offset(20)
            make.top.equalTo(line.snp.bottom).offset(20)
        }
    }
    
    func prepareMealImage() {
        scrollView.addSubview(mealImage)
        
        mealImage.snp.makeConstraints { (make) in
            make.width.equalTo(line.snp.width)
            make.height.equalTo(mealImage.snp.width)
            make.left.equalTo(scrollView.snp.left).offset(20)
            make.top.equalTo(mealName.snp.bottom).offset(20)
        }
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 375))
        backgroundImage.image = menuItem.menuItemPicture
        backgroundImage.contentMode = .scaleToFill
        mealImage.insertSubview(backgroundImage, at: 0)
    }
    
    func prepareMealDesc() {
        mealDesc.text = menuItem.menuItemDescription
        mealDesc.font = UIFont(name: "Helvetica", size: 16);
        mealDesc.numberOfLines = 0
        mealDesc.textColor = Color.grey.darken4
        scrollView.addSubview(mealDesc)
        
        mealDesc.snp.makeConstraints { (make) in
            make.width.equalTo(mealImage.snp.width)
            make.top.equalTo(mealImage.snp.bottom).offset(20)
            make.centerX.equalTo(scrollView.snp.centerX)
        }
    }
}

// Manage all of the actions from the
// view controller
extension MealViewController {
    // Navigate to the previous view controller
    @objc func goBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
