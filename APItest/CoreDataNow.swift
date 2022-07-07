//
//  AlamoAPI.swift
//  APItest
//
//  Created by Peter Delgado on 13/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import Combine
import CoreData
import UIKit
class CoreDataNow{

	var reqMetArray : Array? = []
	var urlArray : Array? = []

//	private var container: NSPersistentContainer?
//	private let entityName: String = "Entity"


//	@Published var savedEntities: [Entity] = []


//	init() {
//
//
//		let backgroundContext = container?.newBackgroundContext()
//
//		container = NSPersistentContainer(name: "ModelHis")
//		container?.loadPersistentStores { (_, error) in
//				if let error = error {
//					print("Error loading Core Data! \(error)")//
//				}
//				self.getFavorites();
//			}
//		}

//	private func getFavorites() {
//		
//
//
//		let request = NSFetchRequest<Entity>(entityName: entityName)
//		request.returnsObjectsAsFaults = false
//
//		do {
//			savedEntities = try container!.viewContext.fetch(request)
//			for resultGot in savedEntities as [NSManagedObject]{
//
//				if let expName = resultGot.value(forKey:"url") as? String{
//
//
//
//					self.urlArray?.append(expName)
//					//tableView.reloadData()
//
//					//print("my array is : \(urlArray)")
//				}
//
//				if let expName2 = resultGot.value(forKey:"reqMethod") as? String{
//
//					self.reqMetArray?.append(expName2)
//					//tableView.reloadData()
//
//					//print("my array is : \(reqMetArray)")
//				}
//
//
//			}
//		} catch let error {
//			print("Error fetching Favorities Entities. \(error)")
//		}
//	}
//
//
//






	}
