//
//  HistTableViewCell.swift
//  APItest
//
//  Created by Peter Delgado on 6/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit

class HistTableViewCell: UITableViewCell {


	@IBOutlet var authorLabel: UILabel!
	@IBOutlet var contentsLabel: UILabel!


	static let reuseIdentifier = "HistoryCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
