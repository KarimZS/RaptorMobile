import UIKit
import Material
import SnapKit

class MealDetailsViewController: MealViewController {
    let redeemButton = RaisedButton(title: "Redeem", titleColor: .white)
    let redeemCode = UILabel()

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Setup redeem button / actions
        prepareRedeemButton()
        prepareRedeemLabel()
        
        // Setup scrollView to have correct contentSize
        let width = self.view.frame.width
        let height = self.view.frame.height + 75
        scrollView.contentSize = CGSize(width: width, height: height)
    }
}

// Manage all setup functions - which each
// prepare a different element of the view.
extension MealDetailsViewController {
    func prepareRedeemButton() {
        redeemButton.pulseColor = .white
        redeemButton.backgroundColor = Color.red.darken1
        redeemButton.addTarget(self, action: #selector(redeem), for: .touchUpInside)
        self.view.addSubview(redeemButton)
        
        redeemButton.snp.makeConstraints { (make) in
            make.width.equalTo(line.snp.width)
            make.height.equalTo(50)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(mealDesc.snp.bottom).offset(20)
        }
    }
    
    func prepareRedeemLabel() {
        redeemCode.text = menuItem.menuItemRedeemCode
        redeemCode.font = UIFont(name: "Helvetica", size: 22);
        redeemCode.textColor = Color.blue.base
        redeemCode.isHidden=true;
        self.view.addSubview(redeemCode)
        
        redeemCode.snp.makeConstraints { (make) in
            make.centerX.equalTo(redeemButton.snp.centerX)
            make.top.equalTo(redeemButton.snp.bottom).offset(10)
        }
    }
}

// Manage all of the actions from the
// view controller
extension MealDetailsViewController {
    // Redeem the current meal item
    @objc func redeem(sender: UIButton!) {
        redeemCode.isHidden = false;
    }
}
