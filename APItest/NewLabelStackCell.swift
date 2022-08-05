//
//  NewLabelStackCell.swift
//  APItest
//
//  Created by Peter Delgado on 5/8/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import EasyPeasy
import StackScrollView
final class NewLabelStackCell: StackCellBase {

	private let label = UILabel()

	init(title: String) {
		super.init()

		addSubview(label)

		label <- [
			Top(>=8),
			Left(8),
			Right(4),
			Bottom(<=8),
			CenterY(),
		]

		self <- [
			Height(>=40),
		]

		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.text = title
		label.textColor = .link
	}
}
