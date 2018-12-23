import UIKit
import Material

class AppTabsController: TabsController {
    open override func prepare() {
        super.prepare()
        tabBar.setLineColor(Color.red.darken1, for: .selected)
        
        tabBar.setTabItemsColor(Color.grey.darken2, for: .normal)
        tabBar.setTabItemsColor(Color.grey.darken1, for: .selected)
        tabBar.setTabItemsColor(Color.grey.darken2, for: .highlighted)
    }
}
