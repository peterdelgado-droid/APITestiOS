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

	var history = History()

	var receivedString = ""
	var receivedString2 = ""
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	
	@IBAction func addRequest(_ sender: Any) {


		guard let managedObjectContextP = managedObjectContext else {

			fatalError("No Managed Object Context Available")
		}

		let request = Entity(context: self.context)

		request.url = Manager.messageText[2] 
		request.reqMethod = Manager.messageText[1]


		do {
			// Save Book to Persistent Store
			try self.context.save()
			

			// Dismiss View Controller
			dismiss(animated: true)
		} catch {
			print("Unable to Save Request, \(error)")
		}


	history.fetchRequests()

	}

//https://gorest.co.in/public/v2/users?email=test&name=peter&gender=male&status=active&email=asdfasdfasdf@gmail.com
	@IBOutlet weak var texTry: UITextView?

	var verificationId = String()


	override func viewDidLoad(){
		super.viewDidLoad()

		
		
		//Manager.messageText.append("now")
		if Manager.messageText.indices.contains(0){
			print(Manager.messageText[0])
			texTry?.text = Manager.messageText[0]

		}


		
	}

}
