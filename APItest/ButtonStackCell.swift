

import UIKit

import EasyPeasy

final class ButtonStackCell: StackCellBase {
  
  var tapped: () -> Void = {}
  
  private let button = UIButton(type: .system)
  let textfieldParamsKey = UITextField()
  let textfieldParamsValue = UITextField()
  
  init(buttonTitle: String) {
    super.init()

	  textfieldParamsKey.font = UIFont.preferredFont(forTextStyle: .body)
	  textfieldParamsKey.attributedPlaceholder = NSAttributedString(
		string: "Key",
		attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
	  )

	  addSubview(textfieldParamsKey)
	  textfieldParamsKey <- Edges(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))

	  self <- Height(>=40)




	  textfieldParamsValue.font = UIFont.preferredFont(forTextStyle: .body)
	  textfieldParamsValue.attributedPlaceholder = NSAttributedString(
		string: "Value",
		attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
	  )

	  addSubview(textfieldParamsValue)

	  textfieldParamsValue <- Edges(UIEdgeInsets(top: 8, left: 150, bottom: 8, right: 16))

	  self <- Height(>=40)



	  button.setImage(UIImage(named: "custom.plus"), for: .normal)
    backgroundColor = .white
    
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    addSubview(button)
    button <- [
      Trailing(),
      Top(12),
      Bottom(12),
	
    ]


	 
    
    button.setTitle(buttonTitle, for: .normal)
  }
  
  @objc private func buttonTapped() {
    tapped()
  }

	func set(placeholder: String) {
	//	textfield.placeholder = "Key,Value"
	}
}
