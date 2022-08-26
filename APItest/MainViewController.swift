

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
import ScrollingStackViewController
import EasyPeasy
import StackScrollView

class presentationSheet: UIViewController{

	override func viewDidLoad(){
		super.viewDidLoad()

	}

}


let notificationKey = "peter.key"
let notificationKeyHeaders = "peter.key.headers"
let notiBasicAuth = "peter.basic.auth"
let bodyKey = "peter.body"

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
	public var wrappedValue: T {
		didSet {
			wrappedValue.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	public init(wrappedValue: T) {
		self.wrappedValue = wrappedValue
		wrappedValue.translatesAutoresizingMaskIntoConstraints = false
	}
}



@available(iOS 15.0, *)
open class MainViewController: UIViewController{
	var passedValue:String!





//	var ParamsKey:String?
	var Headers = [String : String]()
	var ParamsKey = [String : Any]()
	var BasicAuth = [String : String]()

	@UsesAutoLayout
	private var stackScrollView = StackScrollView()

	open override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

	}

	var viewController1: UIViewController!
	var viewController2: UIViewController!
	var valueP:String!


//	var passedValue:String!
	var passedValue2:String!

	@IBOutlet var reqLabel: UILabel!


//	@IBOutlet weak private var stackView: UIStackView!



	let rect = CGRect(x: 5, y: 220, width: 350, height: 450)

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var changeCityTextField: UITextField!





	@IBOutlet weak var closeIcon: UIButton!
	@IBOutlet weak var reqButton: UIButton!


     var StringTest: String!


	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	let itemsVC = presentationSheet()



	open override func viewDidLoad() {
        super.viewDidLoad()

//		let bottomOffset: CGFloat = (99) // this your tabbar height you can replace with static number eg. 44
//		stackScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomOffset, right: 0)


		createObservers()




		var views: [UIView] = []
		let makeRemovableButton: () -> [UIView] = {

			let s = self.fullSeparator()

			var views: [UIView] = []

			views.append({
				let v = NewButtonStackCell(buttonTitle: "Remove")
				v.self.removeImage()

				v.tapped = { [unowned v] in
					v.remove()
			//		s.remove()
				}
				return v
			}())
			views.append(s)
			return views
		}



		views.append(contentsOf: { () -> [UIView] in
			let v = NewButtonStackCell(buttonTitle: "")
			let s = self.fullSeparator()
			v.tapped = { [unowned stackScrollView, unowned s] in
				var views = (0 ... .random(in: 0 ... 0)).flatMap { _ in makeRemovableButton() }
				stackScrollView.insert(views: views, before: s, animated: true)
				views.append(s)
			}
			return [v, s]
		}())

		views.append(NewLabelStackCell(title: "Headers"))

		views.append(contentsOf: { () -> [UIView] in
			let v = HeadersStackCell(buttonTitle: "")
			let s = self.fullSeparator()
			v.tapped = { [unowned stackScrollView, unowned s] in
				var views = (0 ... .random(in: 0 ... 0)).flatMap { _ in makeRemovableButton() }
				stackScrollView.insert(views: views, before: s, animated: true)
				views.append(s)
			}
			return [v, s]
		}())

		views.append(NewLabelStackCell(title: "Body"))

		views.append({
			let v = NewTextViewStackCell()

			return v
		}())

		let s = self.fullSeparator()
		views.append(s)

		views.append(NewLabelStackCell(title: "Basic Auth"))

		views.append(contentsOf: { () -> [UIView] in
			let v = BasicAuthStackCell(buttonTitle: "")
			let s = self.fullSeparator()
			v.tapped = { [unowned stackScrollView, unowned s] in
				var views = (0 ... .random(in: 0 ... 0)).flatMap { _ in makeRemovableButton() }
				stackScrollView.insert(views: views, before: s, animated: true)
				views.append(s)
			}
			return [v, s]
		}())

		let p = self.fullSeparator()
		views.append(p)

		views.append(NewLabelStackCell(title: "OAuth"))
		views.append(contentsOf: { () -> [UIView] in
			let v = NewOAuthStackCell(buttonTitle: "")
			let s = self.fullSeparator()
			v.tapped = { [unowned stackScrollView, unowned s] in
				var views = (0 ... .random(in: 0 ... 0)).flatMap { _ in makeRemovableButton() }
				stackScrollView.insert(views: views, before: s, animated: true)
				views.append(s)
			}
			return [v, s]
		}())

		

		stackScrollView.append(views: views)

		var config = UIButton.Configuration.filled()
		config.title = "show sheet"

		let button = UIButton(configuration: config, primaryAction: UIAction(){ _ in

			if let sheet = self.itemsVC.sheetPresentationController{
				sheet.detents = [.medium(), .large()]
			}

			self.present(self.itemsVC, animated: true, completion: nil)

		})



		//stackScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		stackScrollView.frame = rect

		
		view.addSubview(stackScrollView)
		//for responsive ui
		stackScrollView.translatesAutoresizingMaskIntoConstraints = false
		stackScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220).isActive = true
		stackScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true

		stackScrollView.heightAnchor.constraint(equalToConstant: 5).isActive = true
	    stackScrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true

		

		//let swiftUIToggler = SheetView(externalSwitch: reqLabel)
	//	let content = UIHostingController(rootView:swiftUIToggler)

//		addChild(content)
//
//		view.addSubview(content.view)
//        content.view.translatesAutoresizingMaskIntoConstraints = false
//        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
//        content.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
//        content.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        content.view.widthAnchor.constraint(equalToConstant: 110).isActive = true
//		content.view.backgroundColor = .clear
//        content.view.layer.cornerRadius = 5

//
////		if(passedValue2 == nil){
////			reqLabel?.text = "GET"
////
////		}else{
////			reqLabel?.text = passedValue2
////		}
//




//
    }



	let noti = Notification.Name(rawValue: notificationKey)
	let notiHeaders = Notification.Name(rawValue: notificationKeyHeaders)
	let notificationBasicAuth = Notification.Name(rawValue: notiBasicAuth)
	let notiBody = Notification.Name(rawValue: bodyKey)

	func createObservers(){
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateParamsKey(notification:)), name: noti, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateHeaders(notification:)), name: notiHeaders, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.basicAuth(notification:)), name: notificationBasicAuth, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.bodyData(notification:)), name: notiBody, object: nil)
	}


	@objc func updateParamsKey(notification: NSNotification){
		guard let userParams = notification.userInfo as NSDictionary? as? [String: Any] else {return}
		ParamsKey = userParams

	}

	@objc func updateHeaders(notification: NSNotification){
		guard let userInfo = notification.userInfo as NSDictionary? as? [String: String] else {return}

		Headers = userInfo

	}

	@objc func basicAuth(notification: NSNotification){
		guard let userInfo = notification.userInfo as NSDictionary? as? [String: String] else {return}
		BasicAuth = userInfo




		let cookieHeader = (BasicAuth.compactMap({ (key, value) -> String in
			return "\(key)\(value)"
		}) as Array).joined(separator: "")

		print(cookieHeader) // key2=value2;key1=value1

//		let credentialData = cookieHeader.description.data(using: .utf8)
//		let base64Credentials = credentialData?.base64EncodedData()
//		Headers = ["Authorization": "Basic \(String(describing: base64Credentials))="]




		let utf8str = cookieHeader.description.data(using: .utf8)

		if let base64Encoded = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)) {
			print("Encoded: \(base64Encoded)")



			Headers = [
				"Authorization" : "Basic " + base64Encoded
				]



		}
	}

	@objc func bodyData(notification: NSNotification){
		guard let userInfo = notification.object as? String else {return}

	var testing = convertToDictionary(text: userInfo)

		ParamsKey = [
			"name" : testing ?? "ete"
		]

	}


	private func fullSeparator() -> SeparatorStackCell {
		return SeparatorStackCell(leftMargin: 0, rightMargin: 0, backgroundColor: .clear, separatorColor: UIColor(white: 0.90, alpha: 1))
	}


	func convertToDictionary(text: String) -> [String: Any]? {
		if let data = text.data(using: .utf8) {
			do {
				return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
			} catch {
				print(error.localizedDescription)
			}
		}
		return nil
	}

	func getData(url: String) {
        var cityName = changeCityTextField.text!
		let reqName = reqLabel.text!
		if reqLabel.text == "GET"{
			//cityName.insert(contentsOf: "get", at: cityName.endIndex)

			let httpHeaders: HTTPHeaders = [
				"Authorization": "Basic dXNlcjpwYXNzd2Q="
			]



			Headers = [
				"Authorization" : "Basic dXNlcjpwYXNzd2Q="
			]


			Alamofire.request(url, method: .get, parameters: ParamsKey, headers: Headers).responseData { [self]
                        response in
                       if response.result.isSuccess {
                            print("Success")


							let weatherJSON : JSON = JSON(response.result.value!)

						   Manager.messageText.append(weatherJSON.rawString() ?? "ete")



							let storyboard = UIStoryboard(name: "Main", bundle: nil)
							let destVC = storyboard.instantiateViewController(withIdentifier: "Response") as! ResponseViewController
							destVC.managedObjectContext =  context
							destVC.changeCityTextField?.text = cityName
							destVC.reqLabel?.text = reqName
							Manager.reqMessage.append(reqName)
							Manager.url.append(cityName)
						    self.present(destVC, animated: true, completion: nil)


                        }
                        else {
                            print("Error \(String(describing: response.result.error))")
                         //   self.cityLabel.text = "Issue in connection"
                        }
                    }


        }else if reqLabel.text == "POST" {

            /*
             If the server uses consumer key and consumer secret, uncomment the follow lines
             */
          //  cityName.insert(contentsOf: "post", at: cityName.endIndex)
	//		let keyParam = passedValue as String


            /*
             If you are using Basic Authentication uncomment the follow line and add your base64 string
             Replace 'nil' with 'httpHeaders' in headers
             */

            let httpHeaders: HTTPHeaders = [
                "Authorization": "Bearer d003a27408f777983ced2aefc523239924b3f6d52f0e93b8d9a03412270e3ef3"
            ]


//			Headers = [
//				"Authorization" : "Basic cGV0ZXJkZWxnYWRvLWRyb2lkOmdocF91OXNhVmRLTlZtMXV0UE1WQ09QYTVuRHlHNEdxN2QwNjVaMkw="
//			]



			Alamofire.request(url, method: .post,  parameters: ParamsKey, encoding: JSONEncoding.default, headers: Headers).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")




							let weatherJSON : JSON = JSON(response.result.value!)
							Manager.messageText.append(weatherJSON.rawString() ?? "ete")

							let dict = convertToDictionary(text: weatherJSON.rawString() ?? "ete")



							Manager.body = [
								"All Response" : dict ?? "ete"
							]

							let storyboard = UIStoryboard(name: "Main", bundle: nil)
							let destVC = storyboard.instantiateViewController(withIdentifier: "Response") as! ResponseViewController
							destVC.managedObjectContext = context
							destVC.changeCityTextField?.text = cityName
							destVC.reqLabel?.text = reqName
							Manager.messageText.append(reqName)
							Manager.messageText.append(cityName)
							self.present(destVC, animated: true, completion: nil)

                        }
                        else {

                            print("Error \(String(describing: response.result.error))")

                        }
                }
        }else if reqLabel.text == "DELETE"{
            cityName.insert(contentsOf: "delete", at: cityName.endIndex)
        Alamofire.request(url, method: .delete, parameters: nil).responseJSON { [self]
                    response in
                    if response.result.isSuccess {
                        print("Success")

                        let weatherJSON : JSON = JSON(response.result.value!)
                     //   self.texTry.text = weatherJSON.rawString()

                    }
                    else {

                        print("Error \(String(describing: response.result.error))")
                     //   self.cityLabel.text = "Issue in connection"
                    }


        }

        }
        else if reqLabel.text == "PUT"{
            cityName.insert(contentsOf: "post", at: cityName.endIndex)




            Alamofire.request(url, method: .put, parameters: ParamsKey).responseJSON { [self]
                    response in
                    if response.result.isSuccess {
                        print("Success")

                        let weatherJSON : JSON = JSON(response.result.value!)
                    //    self.texTry.text = weatherJSON.rawString()

                    }
                    else {

                        print("Error \(String(describing: response.result.error))")
                     //   self.cityLabel.text = "Issue in connection"
                    }


        }

        }


    }


	@IBAction func selectRequest(_ sender: UIButton) {
		//1 Get the city name the user entered in the text field

		let optionsClosure = { (action: UIAction) in
			self.reqLabel.text = action.title
		}
		reqButton.menu = UIMenu(children: [
			UIAction(title: "GET", state: .on, handler: optionsClosure),
			UIAction(title: "POST", handler: optionsClosure),
			UIAction(title: "PUT", handler: optionsClosure),
			UIAction(title: "DELETE", handler: optionsClosure),
			UIAction(title: "PATCH", handler: optionsClosure)
		])

		reqButton.showsMenuAsPrimaryAction = true

	}


    //1
    @IBAction func getPressed(_ sender: UIButton) {
//1 Get the city name the user entered in the text field


		let cityName = changeCityTextField.text!


        //2 If we have a delegate set, call the method userEnteredANewCityName
        getData(url: cityName)

        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)

    }







    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let viewController = segue.destination as? ResponseViewController {
			viewController.managedObjectContext = context
			viewController.changeCityTextField.text = changeCityTextField.text
			viewController.reqLabel.text = reqLabel.text
		}
    }

	@IBAction func CloseModal(_ sender: Any) {

		self.dismiss(animated: true, completion: nil)
	}


	 func clearValues() {
		 changeCityTextField?.text = ""
	}


}

private func fullSeparator() -> SeparatorStackCell {
	return SeparatorStackCell(leftMargin: 1, rightMargin: 1, backgroundColor: .blue, separatorColor: UIColor(white: 0.90, alpha: 1))
}






import Foundation
