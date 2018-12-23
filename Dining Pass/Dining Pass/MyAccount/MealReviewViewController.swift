import UIKit
import Material
import SnapKit
import Cosmos

class MealReviewViewController: MealViewController , UITextViewDelegate{
    
    let topLine = UIView()
    let reviewLabel = UILabel()
    let bottomLine = UIView()
    
    let reviewStars = CosmosView()
    let reviewText = UITextView(frame: CGRect(x: 20,y: 90,width: 250,height: 100))
    let reviewButton = RaisedButton(title: "Submit Review", titleColor: .white)
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Setup review label / action
        prepareTopLine()
        prepareReviewLabel()
        prepareBottomLine()
        
        prepareReviewStars()
        prepareReviewText()
        prepareReviewButton()
        
        // Setup scrollView to have correct contentSize
        let width = self.view.frame.width
        let height = self.view.frame.height + 250
        scrollView.contentSize = CGSize(width: width, height: height)
    }
}



extension MealReviewViewController {
    
    func prepareTopLine() {
        topLine.backgroundColor = Color.blue.base
        self.view.addSubview(topLine)
        
        topLine.snp.makeConstraints { (make) in
            make.centerX.equalTo(super.view.snp.centerX)
            make.width.equalTo(super.view.snp.width).offset(-40)
            make.top.equalTo(mealDesc.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
    }
    
    fileprivate func prepareReviewLabel(){
        reviewLabel.text = "Write a Review"
        reviewLabel.font = UIFont(name: "Helvetica", size: 22);
        reviewLabel.textColor = Color.blue.base
        self.view.addSubview(reviewLabel)
        
        reviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topLine.snp.bottom).offset(10)
            make.centerX.equalTo(super.view.snp.centerX)
        }
    }
    
    func prepareBottomLine() {
        bottomLine.backgroundColor = Color.blue.base
        
        self.view.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints { (make) in
            make.centerX.equalTo(super.view.snp.centerX)
            make.width.equalTo(super.view.snp.width).offset(-40)
            make.top.equalTo(reviewLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
    }
    
    fileprivate func prepareReviewStars(){
        self.view.addSubview(reviewStars)
        reviewStars.settings.starSize = 60
        reviewStars.snp.makeConstraints { (make) in
            make.top.equalTo(bottomLine.snp.bottom).offset(20)
            make.left.equalTo(40)
            make.right.equalTo(super.view.snp.right).offset(-40)
            make.height.equalTo(50)
            make.centerX.equalTo(super.view.snp.centerX)
        }
    }
    
    fileprivate func prepareReviewText(){
    
        self.view.addSubview(reviewText)
        
        reviewText.textColor = Color.red.darken1
        reviewText.backgroundColor = Color.grey.lighten2
        reviewText.isEditable = true
        
         reviewText.font = UIFont(name: "Helvetica", size: 18)
        reviewText.layer.cornerRadius = 10
        
        reviewText.returnKeyType = .done
        reviewText.keyboardDismissMode = .interactive
        
        reviewText.delegate = self
        
       // reviewText.keyboardType = UIKeyboardType.alphabet
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: .UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardDidHide, object: nil)
        
        reviewText.snp.makeConstraints{(make) in
            make.left.equalTo(reviewStars.snp.left)
            make.top.equalTo(reviewStars.snp.bottom).offset(20)
            make.right.equalTo(reviewStars.snp.right)
            make.height.equalTo(100)
        }
    
    }
    
    @objc fileprivate func keyboardShown(notification: NSNotification){
        if let keyboardInfo = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= (keyboardInfo.height)
            }
        }
    }
    
    //@TODO should be resizing to origin += keyboardSize.height for some reason wasnt working though
    @objc func keyboardHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y  = 0
            }
        }
    }
    
    
    //@TODO this will fail when the user pastes a text that has a "\n"
    //better approach is to add a toolbar with a done button and have that trigger the dismiss.
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    fileprivate func prepareReviewButton() {
        reviewButton.pulseColor = .white
        reviewButton.backgroundColor = Color.red.darken1
        reviewButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.view.addSubview(reviewButton)
        
        reviewButton.snp.makeConstraints { (make) in
            make.width.equalTo(line.snp.width)
            make.height.equalTo(50)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(reviewText.snp.bottom).offset(20)
        }
    }
}
