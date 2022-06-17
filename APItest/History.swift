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

	var quotes = [Entity]()
	var basicBitch = String?.self
	var myArray : Array? = []
	var myArray2 : Array? = []



//	fileprivate func updateView() {
//		var hasQuotes = false
//
//		if let quotes = fetchedResultsController.fetchedObjects {
//			hasQuotes = quotes.count > 0
//		}
//
//		tableView.isHidden = !hasQuotes
//		messageLabel.isHidden = hasQuotes
//
//		activityIndicatorView.stopAnimating()
//	}
	

	private lazy var persistentContainer: NSPersistentContainer = {
		NSPersistentContainer(name: "ModelHis")
	}()




override func viewDidLoad(){
		super.viewDidLoad()
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	let context = appDelegate.persistentContainer.viewContext


	let request = NSFetchRequest <NSFetchRequestResult> (entityName: "Entity")
	request.returnsObjectsAsFaults = false


	do {

		let results = try context.fetch(request)


		// check data existance
		if results.count>0 {
			print(results.count)

			for resultGot in results as! [NSManagedObject]{

				if let expName = resultGot.value(forKey:"url") as? String{

					myArray?.append(expName)
					tableView.reloadData()


					print("my array is : \(myArray)")
				}

				if let expName2 = resultGot.value(forKey:"reqMethod") as? String{

					myArray2?.append(expName2)
					tableView.reloadData()

					print("my array is : \(myArray)")
				}

				break
			}

		}

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

			destinationVC?.closeIcon?.isHidden = false
			destinationVC?.passedValue = myArray? [indexPath.row] as! String?
			destinationVC?.passedValue2 = myArray2? [indexPath.row] as! String?



			self.present(destinationVC!, animated: true, completion: nil)
		} else {
			// Fallback on earlier versions
		}








	}


	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


		dynamicHeight.constant = tableView.contentSize.height


		print(myArray?.count)
		return myArray!.count

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HistTableViewCell.reuseIdentifier, for: indexPath) as? HistTableViewCell else {
			fatalError("Unexpected Index Path")
		}



		// Fetch Quote
		//let quotes = fetchedResultsControllerNew.object(at: indexPath)

		// Configure Cell
		cell.authorLabel.text = myArray? [indexPath.row] as! String?
		cell.contentsLabel.text = myArray2? [indexPath.row] as! String?





		return cell
	}


	private func setupView() {
		setupMessageLabel()

	//	updateView()
	}

	private func setupMessageLabel() {
		messageLabel.text = "You don't have any quotes yet."
	}


//	public func fetchBooks() {
//
//
//		// Create Fetch Request
//		let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
//		//fetchRequest.predicate = NSPredicate(format: "reqMethod == %@", query)
//
//		// Perform Fetch Request
//		persistentContainer.viewContext.perform {
//			do {
//				// Execute Fetch Request
//				let result = try fetchRequest.execute()
//
//				for data in result as [NSManagedObject] {
//
//					print("BasicBitch")
//					print(data.value(forKey: "url") as? String)
//					print(data.value(forKey: "reqMethod") as? String)
//				}
//
//				// Update Books Label
//				//	print(result)
//
//
//			} catch {
//				print("Unable to Execute Fetch Request, \(error)")
//			}
//		}
//	}





	@IBAction func deleteHistory(_ sender: Any) {

		myArray?.removeAll()
		myArray2?.removeAll()
		tableView.reloadData()


	}



}



//extension History: UITableViewDataSource {
//
//
//
//
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//
//		return quotes.count
//	}
//
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		guard let cell = tableView.dequeueReusableCell(withIdentifier: HistTableViewCell.reuseIdentifier, for: indexPath) as? HistTableViewCell else {
//			fatalError("Unexpected Index Path")
//		}
//
//
//
//		// Fetch Quote
//		let quotes = fetchedResultsControllerNew.object(at: indexPath)
//
//		// Configure Cell
//		cell.authorLabel.text = quotes.reqMethod
//		cell.contentsLabel.text = quotes.url
//		return cell
//	}
//
//}










