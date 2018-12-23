import UIKit
import Material

class MyAccountViewController: UIViewController {
    
    // Dining pass design / Navigation
    let topbar = UIView()
    let diningPassLabel = UILabel()
    
    // My Account Elements
    let progressView = UIView()
    let progressBar = UIProgressView()
    let progressLabel = UILabel()
    let progressUpgrade = RaisedButton(title: "Upgrade My Plan", titleColor: .white)
    let myHistoryLabel = UILabel()
    let historyView = UIScrollView()
    
    // Initalizers / Setup
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten3
        
        prepareTabItem()
        prepareTopbar()
        prepareMyAccountLabel()
        prepareProgressView()
        prepareProgressBar()
        prepareProgressLabel()
        prepareProgressUpgrade()
        prepareMyHistoryLabel()
        prepareHistoryView()
    }
}

extension MyAccountViewController {
    fileprivate func prepareTabItem() {
        tabItem.image = Icon.work
        tabItem.title = "My Account"
    }
    
    fileprivate func prepareTopbar() {
        topbar.backgroundColor = Color.red.darken1
        self.view.addSubview(topbar)
        
        topbar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(60)
        }
    }
    
    fileprivate func prepareMyAccountLabel() {
        diningPassLabel.text = "My Account"
        diningPassLabel.font = UIFont(name: "Helvetica", size: 18);
        diningPassLabel.textColor = Color.white
        topbar.addSubview(diningPassLabel)
        
        diningPassLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topbar.snp.centerX)
            make.centerY.equalTo(topbar.snp.centerY).offset(5)
        }
    }
    
    fileprivate func prepareMyHistoryLabel() {
        myHistoryLabel.text = "Meals I have enjoyed"
        myHistoryLabel.font = UIFont(name: "Helvetica", size: 20);
        myHistoryLabel.textColor = Color.red.base
        self.view.addSubview(myHistoryLabel)
        
        myHistoryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(super.view.snp.left)
            make.top.equalTo(progressView.snp.bottom).offset(10)
            make.right.equalTo(super.view.snp.right)
        }
    }

    fileprivate func prepareProgressView() {
        progressView.backgroundColor = Color.white
        self.view.addSubview(progressView)
        
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(topbar.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(80)
        }
    }
    
    fileprivate func prepareProgressBar() {
        progressBar.progress = 0.4
        progressBar.tintColor = Color.red.base
        progressBar.progressViewStyle = UIProgressViewStyle.bar
        progressBar.trackTintColor = Color.grey.lighten2
        progressView.addSubview(progressBar)
        
        progressBar.snp.makeConstraints{ (make) in
            make.left.equalTo(progressView.snp.left)
            make.bottom.equalTo(progressView.snp.bottom).offset(-10)
            make.width.equalTo(progressView.snp.width)
            make.height.equalTo(20)
        }
    }
    
    fileprivate func prepareProgressLabel() {
        progressLabel.text = "You have used 2/5 meals"
        progressLabel.font = UIFont(name: "Helvetica", size: 20);
        progressLabel.textColor = Color.red.base
        progressView.addSubview(progressLabel)
        
        progressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(progressView.snp.left)
            make.top.equalTo(progressView.snp.top).offset(10)
        }
    }
    
    fileprivate func prepareProgressUpgrade() {
        progressUpgrade.pulseColor = .white
        progressUpgrade.backgroundColor = Color.red.base
        progressView.addSubview(progressUpgrade)
        
        progressUpgrade.snp.makeConstraints { (make) in
            make.right.equalTo(progressView.snp.right).offset(-10)
            make.top.equalTo(progressLabel.snp.top)
            make.bottom.equalTo(progressLabel.snp.bottom)
        }
    }
    
    fileprivate func prepareHistoryView() {
        historyView.backgroundColor = Color.grey.lighten3
        self.view.addSubview(historyView)
        
        prepareHistoryViewEntries()
        
        historyView.snp.makeConstraints { (make) in
            make.right.equalTo(super.view.snp.right)
            make.top.equalTo(myHistoryLabel.snp.bottom).offset(10)
            make.bottom.equalTo(super.view.snp.bottom)
            make.left.equalTo(super.view.snp.left)
        }
    }
    
    fileprivate func prepareHistoryViewEntries() {
        prepareHistoryViewEntry(menuItem: GlobalVariables.metroGrill, offset: 10, action: #selector(goToDetailsOne))
        prepareHistoryViewEntry(menuItem: GlobalVariables.edenHill, offset: 120, action: #selector(goToDetailsTwo))
    }
    
    fileprivate func prepareHistoryViewEntry(menuItem: RestaurantMenuItem,
                                             offset: Int,
                                             action: Selector) {
        let listItem = MealListItemView(menuItem: menuItem, showDetails: false)
        listItem.button.addTarget(self, action: action, for: .touchUpInside)
        historyView.addSubview(listItem)
        
        listItem.snp.makeConstraints { (make) in
            make.width.equalTo(historyView.snp.width).offset(-20)
            make.centerX.equalTo(historyView.snp.centerX)
            make.height.equalTo(100)
            make.top.equalTo(historyView.snp.bottom).offset(offset)
        }
    }
}

// Handle navigation actions
extension MyAccountViewController {
    @objc fileprivate func goToDetailsOne(sender: UIButton!) {
        present(MealReviewViewController(menuItem: GlobalVariables.metroGrill),
                animated: true,
                completion: nil)
    }
    
    @objc fileprivate func goToDetailsTwo(sender: UIButton!) {
        present(MealReviewViewController(menuItem: GlobalVariables.edenHill),
                animated: true,
                completion: nil)
    }
}
