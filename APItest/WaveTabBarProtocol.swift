

import Foundation

protocol WaveTabBarProtocol: class {
    
    func showTabBar(_ show: Bool, animated: Bool, over duration: TimeInterval)
    
    func disableTransparentTabBar()
    
    func setupTabBarTags()
    
    func setupCurve(_ radius: Float)
    
    func setupCircle(_ width: Float)
    
    func updateCircleSize(_ radius: Float)
    
    func setupTabBarColoring()
    
    func setupTabBarBackground()
    
    func setupImageView(_ center: Float)
    
    func updateImageViewSize(_ center: Float)
    
    func updateImageView()
    
    func moveCurve(with duration: TimeInterval, to index: Int, with radius: Float)
    
    func moveCircle(over duration: TimeInterval, offset circleOffset: Float, down movingDown: Bool)
    
    func updateCircleCenter()
    
}
