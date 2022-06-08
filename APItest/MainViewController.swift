

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



@available(iOS 15.0, *)
open class MainViewController: UIViewController{

	var passedValue:String!
	var passedValue2:String!

	@IBOutlet var reqLabel: UILabel!

	let xPos : CGFloat = 0
	var yPos : CGFloat = 0

	let xPos2 : CGFloat = 0
	var yPos2 : CGFloat = 0


	let xPos3 : CGFloat = 0
	var yPos3 : CGFloat = 0

	let xPos4 : CGFloat = 0
	var yPos4 : CGFloat = 0

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var sendParamsKeyTextField: UITextField!
    @IBOutlet weak var sendParamsValueTextField: UITextField!
	@IBOutlet weak var addParams: UIButton!
	@IBOutlet weak var addHeaders: UIButton!
	@IBOutlet weak var Headers: UILabel!
	@IBOutlet weak var closeIcon: UIButton!

    
     var StringTest: String!
	 let ResponseVC = ResponseViewController()


	private lazy var persistentContainer: NSPersistentContainer = {
		NSPersistentContainer(name: "ModelHis")
	}()


    open override func viewDidLoad() {
        super.viewDidLoad()
		if(passedValue == nil){
			closeIcon?.isHidden = true

		}
		changeCityTextField?.text = passedValue


		persistentContainer.loadPersistentStores { [weak self] persistentStoreDescription, error in
			if let error = error {
				print("Unable to Add Persistent Store")
				print("\(error), \(error.localizedDescription)")

			} else {
				print(persistentStoreDescription.url)
				self?.fetchBooks()
				
			}
		}





		let swiftUIToggler = SheetView(externalSwitch: reqLabel)

		let content = UIHostingController(rootView:swiftUIToggler)

		addChild(content)

        view.addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        content.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        content.view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        content.view.widthAnchor.constraint(equalToConstant: 110).isActive = true
        content.view.backgroundColor = .systemTeal
        content.view.layer.cornerRadius = 5

//		if(passedValue2 == nil){
//			reqLabel?.text = "GET"
//
//		}else{
//			reqLabel?.text = passedValue2
//		}

    
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
//					print(data.value(forKey: "url") as? String)
//					print(data.value(forKey: "reqMethod") as? String)
				}

				// Update Books Label
			//	print(result)


			} catch {
				print("Unable to Execute Fetch Request, \(error)")
			}
		}
	}



	func moveDown() {
		UIView.animate(withDuration: 0.5, delay: 0.0, options:[], animations: {
			let screenSize = UIScreen.main.bounds.size
			self.Headers.transform = CGAffineTransform(translationX: 0, y: screenSize.height * 0.1)

			self.addHeaders.transform = CGAffineTransform(translationX: 0, y: screenSize.height * 0.1)
		}, completion: nil)
	}
    
    @IBAction func addParams(_ sender: UIButton) {

		moveDown()

		if yPos == 0{

			yPos = 300

			yPos += 50

			print(yPos)
			let pf = UISwitch()

			let tf = UITextField()
			tf.frame = CGRect(x: 15, y: yPos, width: 120, height: 30)
			tf.backgroundColor = UIColor.white
			tf.layer.cornerRadius = 5
			tf.text = "Key"
			tf.textColor = UIColor.lightGray
			tf.textAlignment = .center
			self.view.addSubview(tf)
			pf.backgroundColor = UIColor.systemTeal
			pf.layer.cornerRadius = 5
			pf.layer.borderWidth = 1
			pf.frame = CGRect(x: 320, y: yPos, width: 50, height: 30)
			self.view.addSubview(pf)

			addSecondTV()
			

		}







    }

	func addSecondTV() {

		if yPos2 == 0{

			yPos2 = 300

		}

		yPos2 += 50

		print(yPos2)
		let tf2 = UITextField()
		tf2.frame = CGRect(x: 180, y: yPos, width: 120, height: 30)
		tf2.backgroundColor = UIColor.white
		tf2.layer.cornerRadius = 5
		tf2.text = "Value"
		tf2.textColor = UIColor.lightGray
		tf2.textAlignment = .center
		self.view.addSubview(tf2)

	}

	func addSecondTV1() {

		if yPos4 == 0{

			yPos4 = 400

		}

		yPos4 += 50

		print(yPos2)
		let tf2 = UITextField()
		tf2.frame = CGRect(x: 180, y: yPos4, width: 120, height: 30)
		tf2.backgroundColor = UIColor.white
		tf2.layer.cornerRadius = 5
		tf2.text = "Value"
		tf2.textColor = UIColor.lightGray
		tf2.textAlignment = .center
		self.view.addSubview(tf2)

	}


	@IBAction func addHeaders(_ sender: UIButton) {


		if yPos3 == 0{

			yPos3 = 400

			yPos3 += 50

			print(yPos)
			let pf = UISwitch()

			let tf = UITextField()
			tf.frame = CGRect(x: 15, y: yPos3, width: 120, height: 30)
			tf.backgroundColor = UIColor.white
			tf.layer.cornerRadius = 5
			tf.text = "Key"
			tf.textColor = UIColor.lightGray
			tf.textAlignment = .center
			self.view.addSubview(tf)
			pf.backgroundColor = UIColor.systemTeal
			pf.layer.cornerRadius = 5
			pf.layer.borderWidth = 1
			pf.frame = CGRect(x: 320, y: yPos3, width: 50, height: 30)
			self.view.addSubview(pf)

			addSecondTV1()

		}

	}
    
    func getData(url: String) {
        var cityName = changeCityTextField.text!
		let reqName = reqLabel.text!
		if reqLabel.text == "GET"{
			cityName.insert(contentsOf: "get", at: cityName.endIndex)

            Alamofire.request(url, method: .get, parameters: nil).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")
							let weatherJSON : JSON = JSON(response.result.value!)

						   Manager.messageText.append(weatherJSON.rawString() ?? "ete")


							let storyboard = UIStoryboard(name: "Main", bundle: nil)
							let destVC = storyboard.instantiateViewController(withIdentifier: "modu") as! ResponseViewController
							destVC.managedObjectContext = persistentContainer.viewContext
							destVC.changeCityTextField?.text = cityName
							destVC.reqLabel?.text = reqName
							Manager.messageText.append(reqName)
							Manager.messageText.append(cityName)
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
            cityName.insert(contentsOf: "post", at: cityName.endIndex)
            let keyParam = sendParamsKeyTextField.text!
            let valueParam = sendParamsValueTextField.text!
            let params : [String: String] = [keyParam: valueParam]
            
            /*
             If you are using Basic Authentication uncomment the follow line and add your base64 string
             Replace 'nil' with 'httpHeaders' in headers
             */
            
            let httpHeaders: HTTPHeaders = [
                "Authorization": "Bearer d003a27408f777983ced2aefc523239924b3f6d52f0e93b8d9a03412270e3ef3"
            ]


			Alamofire.request(url, method: .post,  parameters: params, headers: httpHeaders).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")
							let weatherJSON : JSON = JSON(response.result.value!)
							Manager.messageText.append(weatherJSON.rawString() ?? "ete")


							let storyboard = UIStoryboard(name: "Main", bundle: nil)
							let destVC = storyboard.instantiateViewController(withIdentifier: "modu") as! ResponseViewController
							destVC.managedObjectContext = persistentContainer.viewContext
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
            let keyParam = sendParamsKeyTextField.text!
            let valueParam = sendParamsValueTextField.text!
            let params : [String: String] = [keyParam: valueParam]
            
            
            Alamofire.request(url, method: .put, parameters: params).responseJSON { [self]
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
			viewController.managedObjectContext = persistentContainer.viewContext
			viewController.changeCityTextField.text = changeCityTextField.text
			viewController.reqLabel.text = reqLabel.text
		}
    }
    
	@IBAction func CloseModal(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}


	


}



