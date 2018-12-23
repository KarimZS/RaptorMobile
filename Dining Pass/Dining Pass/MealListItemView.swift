import UIKit
import Material
import SnapKit
import Cosmos

// Defines a list item for a meal
class MealListItemView: UIView {
    // Necessary elements
    let diningIcon = UIView()
    let restLabel = UILabel()
    let mealLabel = UILabel()
    let mealImage = UIView()
    let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 50, height: 50))
    let fullPriceLabel = UILabel()
    let mealPrice = UILabel()
    let review = CosmosView()
    let button = UIButton()
    
    // Initalization / Setup
    init(menuItem: RestaurantMenuItem, showDetails: Bool) {
        super.init(frame: CGRect())
        
        self.backgroundColor = Color.grey.lighten1
        
        diningIcon.backgroundColor = UIColor(patternImage: Icon.place!)
        self.addSubview(diningIcon)
        
        diningIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        restLabel.text = menuItem.restaurantName
        restLabel.font = UIFont(name: "Helvetica", size: 22);
        restLabel.textColor = .white
        self.addSubview(restLabel)
        
        restLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(diningIcon.snp.right).offset(5)
        }
        
        mealLabel.text = menuItem.menuItemName
        mealLabel.font = UIFont(name: "Helvetica-Bold", size: 18);
        mealLabel.textColor = .white
        self.addSubview(mealLabel)
        
        mealLabel.snp.makeConstraints { (make) in
            make.top.equalTo(restLabel.snp.bottom).offset(5)
            make.left.equalTo(restLabel.snp.left)
        }
        
        self.addSubview(mealImage)
        
        mealImage.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.top.equalTo(self.snp.top).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
        }
        
        backgroundImage.image = menuItem.menuItemPicture!
        backgroundImage.contentMode = .scaleAspectFill
        mealImage.insertSubview(backgroundImage, at: 0)
        
        
        if (showDetails) {
            fullPriceLabel.text = "Full Price: "
            fullPriceLabel.font = UIFont(name: "Helvetica", size: 18);
            fullPriceLabel.textColor = .white
            self.addSubview(fullPriceLabel)
            
            fullPriceLabel.snp.makeConstraints { (make) in
                make.top.equalTo(mealLabel.snp.bottom).offset(1)
                make.left.equalTo(mealLabel.snp.left)
            }
            
            mealPrice.text = menuItem.menuItemPrice
            mealPrice.font = UIFont(name: "Helvetica", size: 18);
            mealPrice.textColor = Color.red.darken1
            self.addSubview(mealPrice)
            
            mealPrice.snp.makeConstraints { (make) in
                make.top.equalTo(fullPriceLabel.snp.top)
                make.left.equalTo(fullPriceLabel.snp.right)
            }
        
            self.addSubview(review)
            review.settings.starSize = 15
            review.settings.filledColor = Color.red.darken1
            review.settings.emptyColor = Color.white
            review.settings.starMargin = 3
            review.settings.filledBorderColor = Color.black
            
            review.settings.updateOnTouch = false
            review.rating = menuItem.restaurantRating
            review.snp.makeConstraints{(make) in
                make.top.equalTo(fullPriceLabel.snp.bottom).offset(5)
                make.left.equalTo(fullPriceLabel.snp.left)
            }
            
        }
        
        self.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
