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

class History: UIViewController{


	@IBOutlet var messageLabel: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var activityIndicatorView: UIActivityIndicatorView!

	var quotes = [Entity]()



	fileprivate func updateView() {
		var hasQuotes = false

		if let quotes = fetchedResultsController.fetchedObjects {
			hasQuotes = quotes.count > 0
		}

		tableView.isHidden = !hasQuotes
		messageLabel.isHidden = hasQuotes

		activityIndicatorView.stopAnimating()
	}
	
	private lazy var persistentContainer: NSPersistentContainer = {
		NSPersistentContainer(name: "ModelHis")
	}()




override func viewDidLoad(){
		super.viewDidLoad()
	setupView()

	persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
		if let error = error {
			print("Unable to Load Persistent Store")
			print("\(error), \(error.localizedDescription)")

		} else {
			self.setupView()

			do {
				try self.fetchedResultsController.performFetch()
			} catch {
				let fetchError = error as NSError
				print("Unable to Perform Fetch Request")
				print("\(fetchError), \(fetchError.localizedDescription)")
			}

			self.updateView()
		}
	}


	}


	private func setupView() {
		setupMessageLabel()

	//	updateView()
	}

	private func setupMessageLabel() {
		messageLabel.text = "You don't have any quotes yet."
	}


	private func fetchBooks() {


		// Create Fetch Request
		let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
		//fetchRequest.predicate = NSPredicate(format: "reqMethod == %@", query)

		// Perform Fetch Request
		persistentContainer.viewContext.perform {
			do {
				// Execute Fetch Request
				let result = try fetchRequest.execute()

				for data in result as [NSManagedObject] {


					print("hello")
					print(data.value(forKey: "url") as? String)
					print(data.value(forKey: "reqMethod") as? String)
				}

				// Update Books Label
				//	print(result)


			} catch {
				print("Unable to Execute Fetch Request, \(error)")
			}
		}
	}

	fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Entity> = {
		// Create Fetch Request
		let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()

		// Configure Fetch Request
		fetchRequest.sortDescriptors = [NSSortDescriptor(key: "url", ascending: true)]

		// Create Fetched Results Controller
		let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)

		// Configure Fetched Results Controller
		fetchedResultsController.delegate = self

		return fetchedResultsController
	}()
}



extension History: UITableViewDataSource {



	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quotes.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HistTableViewCell.reuseIdentifier, for: indexPath) as? HistTableViewCell else {
			fatalError("Unexpected Index Path")
		}

		// Fetch Quote
		let quote = fetchedResultsController.object(at: indexPath)

		// Configure Cell
		cell.authorLabel.text = quote.url
		cell.contentsLabel.text = quote.reqMethod

		return cell
	}

}

extension History: NSFetchedResultsControllerDelegate {

	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		switch (type) {
		case .insert:
			if let indexPath = newIndexPath {
				tableView.insertRows(at: [indexPath], with: .fade)
			}
			break;
		default:
			print("...")
		}
	}


	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}

	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()

		updateView()
	}




}

