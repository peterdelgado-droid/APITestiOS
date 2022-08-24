//
//  NewTextViewStackCell.swift
//  APItest
//
//  Created by Peter Delgado on 5/8/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import EasyPeasy
import Foundation
import StackScrollView

final class NewTextViewStackCell: StackCellBase, UITextViewDelegate {

	private let textView = UITextView()

	override init() {
		super.init()

		addSubview(textView)
		textView.easy.layout(Edges(UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8)))

		self.easy.layout(Height(>=80))

		textView.font = UIFont.preferredFont(forTextStyle: .body)
		textView.isScrollEnabled = false
		textView.delegate = self




	}





	func set(value: String) {

		textView.text = value
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		let bodykeyData = textView.text!
		//  let paramsvalueData = textfieldParamsValue.text!
		// retrieve from UserDefault if none create an empty array

		//	  var paramskeyDataList: [String:String] = UserDefaults.standard.object(forKey: "paramskeyDataList") as? [String:String] ?? [:]
		//
		//
		//	  // store in UserDefault
		//	  paramskeyDataList[paramskeyData] = paramsvalueData
		//
		//	  UserDefaults.standard.setValue(paramskeyDataList, forKey: "paramskeyDataList")


		let name = Notification.Name(rawValue: bodyKey)
		NotificationCenter.default.post(name: name, object: bodykeyData)
	}
}
