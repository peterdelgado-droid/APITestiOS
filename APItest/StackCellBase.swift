

import UIKit

import StackScrollView

class StackCellBase: UIControl, StackCellType {
  
  init() {
    super.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
