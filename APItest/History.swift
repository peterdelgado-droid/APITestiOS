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

		tableView.dataSource = self
		tableView.delegate = self

		

		//		let request = NSFetchRequest <NSFetchRequestResult> (entityName: "Entity")
		//		request.returnsObjectsAsFaults = false


		fetchRequests()

	}

	func fetchRequests(){
		do {

			self.request = try context.fetch(Entity.fetchRequest())


			self.tableView?.reloadData()



			// check data existance

			//			print(results.count)

			//			for resultGot in results as! [NSManagedObject]{
			//
			//				if let expName = resultGot.value(forKey:"url") as? String{
			//
			//					urlArray?.append(expName)
			//					tableView.reloadData()
			//
			//
			//					//		print("my array is : \(myArray)")
			//				}
			//
			//				if let expName2 = resultGot.value(forKey:"reqMethod") as? String{
			//
			//					reqMethodArray?.append(expName2)
			//					tableView.reloadData()
			//
			//					//		print("my array is : \(myArray)")
			//				}
			//
			//
			//			}



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
			destinationVC?.passedValue = urlArray? [indexPath.row] as! String?
			destinationVC?.passedValue2 = reqMethodArray? [indexPath.row] as! String?



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


		let sb = UIStoryboard.init(name: "Main", bundle:     nil)
		if #available(iOS 15.0, *) {
			let destinationVC = sb.instantiateViewController(
				withIdentifier: "Wave") as? WaveTabBarController





			self.present(destinationVC!, animated: true, completion: nil)



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










