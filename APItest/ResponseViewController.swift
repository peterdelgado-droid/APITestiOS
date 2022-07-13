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
	@IBOutlet weak var closeIcon: UIButton!


	var history = History()
	var request = MainViewController()

	var receivedString = ""
	var receivedString2 = ""
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	
	@IBAction func addRequest(_ sender: Any) {


//		guard let managedObjectContextP = managedObjectContext else {
//
//			fatalError("No Managed Object Context Available")
//		}

		let request = Entity(context: self.context)

		request.url = Manager.reqMessage.last
		request.reqMethod = Manager.url.last


		do {
			// Save Book to Persistent Store
			try self.context.save()
			
			history.fetchRequests()
			// Dismiss View Controller
			self.dismiss(animated: true, completion: nil)

		} catch {
			print("Unable to Save Request, \(error)")
		}






		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(withIdentifier: "History") as! History
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		history.closeIcon?.isHidden = false
		//show window
		appDelegate.window?.rootViewController = view

//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let destVC = storyboard.instantiateViewController(withIdentifier: "History") as! History
//		self.present(destVC, animated: true, completion: nil)







	}

//https://gorest.co.in/public/v2/users?email=test&name=peter&gender=male&status=active&email=asdfasdfasdf@gmail.com
	@IBOutlet weak var texTry: UITextView?

	var verificationId = String()


	override func viewDidLoad(){
		super.viewDidLoad()

		
		
		//Manager.messageText.append("now")
		if Manager.messageText.indices.contains(0){
			print(Manager.messageText[0])
			texTry?.text = Manager.messageText.last

		}


		
	}



	@IBAction func CloseModal(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(withIdentifier: "Wave") as! WaveTabBarController
		let appDelegate = UIApplication.shared.delegate as! AppDelegate

		//show window
		appDelegate.window?.rootViewController = view
	}


}
