

import UIKit

import EasyPeasy



final class HeadersStackCell: StackCellBase {

	var tapped: () -> Void = {}

	private let button = UIButton(type: .system)
	let textfieldParamsKey = UITextField()
	let textfieldParamsValue = UITextField()
	var paramsKey = [AnyHashable : Any]()
	var paramsValue = String()





	init(buttonTitle: String) {
		super.init()





		textfieldParamsKey.font = UIFont.preferredFont(forTextStyle: .body)
		textfieldParamsKey.attributedPlaceholder = NSAttributedString(
			string: "Key",
			attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
		)
		textfieldParamsKey.textColor = UIColor.white

		//textfieldParamsKey.text = paramsKey
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
		textfieldParamsValue.addTarget(self, action: #selector(paramsKeyEdit), for: .editingDidEnd)
		textfieldParamsKey.autocapitalizationType = UITextAutocapitalizationType.none
		textfieldParamsValue.autocapitalizationType = UITextAutocapitalizationType.none
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



	func removeImage() {
		button.setImage(UIImage(named: ""), for: .normal)

	}




	///var item = [String:String]()
	var someInts: [String] = []

	@objc private func paramsKeyEdit() {



		let paramskeyData = textfieldParamsKey.text!
		let paramsvalueData = textfieldParamsValue.text!
		// retrieve from UserDefault if none create an empty array

		var headerskeyDataList: [String:String] = UserDefaults.standard.object(forKey: "headerskeyDataList") as? [String:String] ?? [:]


		// store in UserDefault
		headerskeyDataList[paramskeyData] = paramsvalueData

		UserDefaults.standard.setValue(headerskeyDataList, forKey: "headerskeyDataList")

		let name = Notification.Name(rawValue: notificationKeyHeaders)
		NotificationCenter.default.post(name: name, object: nil, userInfo: headerskeyDataList)


	}

	func set(placeholder: String) {
		//	textfield.placeholder = "Key,Value"
	}







}
