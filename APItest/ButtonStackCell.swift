

import UIKit

import EasyPeasy

final class ButtonStackCell: StackCellBase {
  
  var tapped: () -> Void = {}
  
  private let button = UIButton(type: .system)
  
  init(buttonTitle: String) {
    super.init()
    
    backgroundColor = .white
    
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    addSubview(button)
    
    button <- [
      Center(),
      Top(12),
      Bottom(12),
    ]
    
    button.setTitle(buttonTitle, for: .normal)
  }
  
  @objc private func buttonTapped() {
    tapped()
  }
}
