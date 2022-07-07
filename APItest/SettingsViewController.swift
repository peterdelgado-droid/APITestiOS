//
//  AddRequestViewController.swift
//  APItest
//
//  Created by Peter Delgado on 6/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit
import SwiftUI


class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


		let content = UIHostingController(rootView:SettingsSwiftUIView())

		addChild(content)

		view.addSubview(content.view)

		content.view.translatesAutoresizingMaskIntoConstraints = false
		content.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		content.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		content.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		content.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true




		content.view.backgroundColor = .clear


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
