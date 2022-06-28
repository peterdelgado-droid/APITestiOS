

import UIKit

import EasyPeasy

final class ButtonStackCell: StackCellBase {
  
  var tapped: () -> Void = {}
  
  private let button = UIButton(type: .system)
  let textfieldParamsKey = UITextField()
  let textfieldParamsValue = UITextField()
	var paramsKey = String()


	private var keyValue: KeyValue
	weak var delegate: KeyValueViewDelegate?

	init(buttonTitle: String) {
    super.init()

	  textfieldParamsKey.font = UIFont.preferredFont(forTextStyle: .body)
	  textfieldParamsKey.attributedPlaceholder = NSAttributedString(
		string: "Key",
		attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
	  )
	  textfieldParamsKey.textColor = UIColor.white

		paramsKey.append(textfieldParamsKey.text!)

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

	func set(placeholder: String) {
	//	textfield.placeholder = "Key,Value"
	}

	struct KeyValue {
		let identifier = UUID().uuidString
		var key: String
		var value: String

		static var empty: KeyValue {
			KeyValue(key: "", value: "")
		}

		var isEmpty: Bool {
			key.isEmpty && value.isEmpty
		}

		var isNotEmpty: Bool {
			!isEmpty
		}
	}

	@objc private func textFieldDidChange() {
		guard let key = textfieldParamsKey.text, let value = textfieldParamsValue.text else {
			return
		}
		keyValue.key = key
		keyValue.value = value
		delegate?.keyValueUpdated(keyValue)
	}




}
