

import UIKit

import EasyPeasy


protocol ButtonStackDelegate: AnyObject {
	func paramKeyEditChange(prmKey: String)
}

final class ButtonStackCell: StackCellBase {
  
  var tapped: () -> Void = {}
  
  private let button = UIButton(type: .system)
  let textfieldParamsKey = UITextField()
  let textfieldParamsValue = UITextField()
	var paramsKey = String()

	weak var delegate: ButtonStackDelegate?


	init(buttonTitle: String) {
    super.init()

	  textfieldParamsKey.font = UIFont.preferredFont(forTextStyle: .body)
	  textfieldParamsKey.attributedPlaceholder = NSAttributedString(
		string: "Key",
		attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
	  )
	  textfieldParamsKey.textColor = UIColor.white

		textfieldParamsKey.text = paramsKey
	  addSubview(textfieldParamsKey)
	  textfieldParamsKey <- Edges(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))

	  self <- Height(>=40)



	  textfieldParamsValue.font = UIFont.preferredFont(forTextStyle: .body)
	  textfieldParamsValue.textColor = UIColor.white
	  textfieldParamsValue.attributedPlaceholder = NSAttributedString(
		string: "Value",
		attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
	  )
	  addSubview(textfieldParamsValue)

	  textfieldParamsValue <- Edges(UIEdgeInsets(top: 8, left: 150, bottom: 8, right: 16))

	  self <- Height(>=40)



	  button.setImage(UIImage(named: "custom.plus"), for: .normal)
	  button.backgroundColor = .black
	  //backgroundColor = .white
	  self.heightAnchor.constraint(equalToConstant: 40).isActive = true

    
   button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


		textfieldParamsKey.addTarget(self, action: #selector(paramsKeyEdit), for: .editingDidEnd)

		addSubview(button)
	    self.layer.cornerRadius = 3


		button <- [
      Trailing(),
      Top(12),
      Bottom(12),
	  Height(50)
	
    ]


	 
    
    button.setTitle(buttonTitle, for: .normal)
		textfieldParamsKey
  }
  
  @objc private func buttonTapped() {
	  tapped()
  }


	@objc private func paramsKeyEdit() {
		paramsKey = "textfieldParamsKey.text!"
		delegate?.paramKeyEditChange(prmKey: paramsKey)
		let name = Notification.Name(rawValue: notificationKey)
		NotificationCenter.default.post(name: name, object: paramsKey)
		}

	func set(placeholder: String) {
	//	textfield.placeholder = "Key,Value"
	}



	



}
