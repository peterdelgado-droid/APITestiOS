

import Foundation

protocol WaveTabBarPresenter: class {
    
    var view: WaveTabBarProtocol { get }
    
    func viewDidLoad()
    
    func viewDidAppear(portrait portraitOrientation: Bool)
    
    func viewDidRotate(portrait portraitOrientation: Bool, at index: Int)
    
    func tabBarDidSelectItem(with tag: Int)
    
    func viewWillLayoutSubviews()
    
    func moveCircleComplete(down movingDown: Bool)
    
}
