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


class ResponseViewController: UIViewController{

	struct ResponseP {
		let rep: String

	}


	var contact: ResponseP?



	@IBOutlet weak var texTry: UITextView?




	override func viewDidLoad(){
		super.viewDidLoad()

		texTry?.text = "contact?.rep"
		self.texTry.ap



	}

}
