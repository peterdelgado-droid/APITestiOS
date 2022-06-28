
import UIKit

import EasyPeasy

final class SeparatorStackCell: StackCellBase {
  
  private let borderView = UIView()
  
  public override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 20 / UIScreen.main.scale)
  }
  
  public init(
    leftMargin: CGFloat = 0,
    rightMargin: CGFloat = 0,
	backgroundColor: UIColor = UIColor.blue,
    separatorColor: UIColor = UIColor(white: 0, alpha: 0.2)) {
    
    super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20 / UIScreen.main.scale))
    
    self.backgroundColor = backgroundColor
    borderView.backgroundColor = separatorColor
    addSubview(borderView)
    
    borderView <- [
      Top(),
      Left(leftMargin),
      Right(rightMargin),
      Height(5 / UIScreen.main.scale),
	  Width(20),
      Bottom()
    ]
  }
}
