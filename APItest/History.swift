//
//  History.swift
//  APItest
//
//  Created by Peter Delgado on 3/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class History: UIViewController,UITableViewDelegate,UITableViewDataSource {



	@IBOutlet var messageLabel: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var activityIndicatorView: UIActivityIndicatorView!
	@IBOutlet var dynamicHeight: NSLayoutConstraint!
	@IBOutlet var delete: UIButton!
	@IBOutlet weak var closeIcon: UIButton!



	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext



	var request: [Entity]?



	var basicBitch = String?.self
	var urlArray : Array? = []
	var reqMethodArray : Array? = []





	override func viewDidLoad(){
		super.viewDidLoad()

		tableView?.dataSource = self
		tableView?.delegate = self

		closeIcon?.isHidden = false

		//		let request = NSFetchRequest <NSFetchRequestResult> (entityName: "Entity")
		//		request.returnsObjectsAsFaults = false


		fetchRequests()

	}

	func fetchRequests(){
		do {

			self.request = try context.fetch(Entity.fetchRequest())


			self.tableView?.reloadData()




		}catch{


			print("No Data to load")
		}



	}







	var valueToPass:String!

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sb = UIStoryboard.init(name: "Main", bundle:     nil)
		if #available(iOS 15.0, *) {
			let destinationVC = sb.instantiateViewController(
				withIdentifier: "Request") as? MainViewController
			let requests = self.request![indexPath.row]
			destinationVC?.closeIcon?.isHidden = false
			destinationVC?.passedValue = requests.url
			destinationVC?.passedValue2 = requests.reqMethod


			self.present(destinationVC!, animated: true, completion: nil)
		} else {
			// Fallback on earlier versions
		}








	}


	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


		dynamicHeight.constant = tableView.contentSize.height


		//	print(myArray?.count)
		return self.request!.count

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HistTableViewCell.reuseIdentifier, for: indexPath) as? HistTableViewCell else {
			fatalError("Unexpected Index Path")
		}



		let requests = self.request![indexPath.row]

		// Configure Cell
		cell.authorLabel.text = requests.url
		cell.contentsLabel.text = requests.reqMethod





		return cell
	}


	private func setupView() {
		setupMessageLabel()

		//	updateView()
	}

	private func setupMessageLabel() {
		messageLabel.text = "You don't have any quotes yet."
	}






	@IBAction func deleteHistory(_ sender: Any) {



		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let managedContext = appDelegate.persistentContainer.viewContext
		let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Entity"))
		do {
			try managedContext.execute(DelAllReqVar)
		}
		catch {
			print(error)
		}

		self.fetchRequests()

	}

	@IBAction func CloseModal(_ sender: Any) {

		self.dismiss(animated: true, completion: nil)


		
			//
			//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
			//		let view = storyboard.instantiateViewController(withIdentifier: "modu") as! ResponseViewController
			//		let appDelegate = UIApplication.shared.delegate as! AppDelegate
			//		//show window
			//		appDelegate.window?.rootViewController = view
			//
			//
			//
			//		self.dismiss(animated: true, completion: nil)
		}




}












