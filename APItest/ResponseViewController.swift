//
//  FirstViewController.swift
//  APItest
//
//  Created by Peter Delgado on 23/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//
import Foundation
import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftUI
import FloatingPanel
import MGSelector
import RxSwift
import RxCocoa
import RxController
import MapKit
import CoreData


class ResponseViewController: UIViewController{

	var managedObjectContext: NSManagedObjectContext?
	@IBOutlet weak var changeCityTextField: UILabel!
	@IBOutlet var reqLabel: UILabel!
	@IBOutlet var addButton: UIButton!


	var receivedString = ""
	var receivedString2 = ""

	@IBAction func addRequest(_ sender: Any) {

		guard let managedObjectContextP = managedObjectContext else {

			fatalError("No Managed Object Context Available")
		}

		let request = Entity(context: managedObjectContextP)

		request.url = Manager.messageText[2]
		request.reqMethod = Manager.messageText[1]


		do {
			// Save Book to Persistent Store
			try managedObjectContextP.save()

			// Dismiss View Controller
			dismiss(animated: true)
		} catch {
			print("Unable to Save Book, \(error)")
		}



	}


	@IBOutlet weak var texTry: UITextView?

	var verificationId = String()


	override func viewDidLoad(){
		super.viewDidLoad()

		texTry?.text = Manager.messageText[0]

//		self.texTry?.text = Manager.messageText[0]
//		self.reqLabel?.text = Manager.messageText[1]
//
	}

}
