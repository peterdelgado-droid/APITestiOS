

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



@available(iOS 15.0, *)
open class MainViewController: UIViewController, ObservableObject {




	@IBOutlet var reqLabel: UILabel!

	let xPos : CGFloat = 0
	var yPos : CGFloat = 0

	let xPos2 : CGFloat = 0
	var yPos2 : CGFloat = 0



    //Constants
    let TEST_URL = "https://httpbin.org/get"
    let APP_ID = "34434da02b9d2c06f7194ac16cd8c4f0"
  



    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var sendParamsKeyTextField: UITextField!
    @IBOutlet weak var sendParamsValueTextField: UITextField!
	@IBOutlet weak var addParams: UIButton!
	@IBOutlet weak var addHeaders: UIButton!

    
     var StringTest: String!
	 let ResponseVC = ResponseViewController()
    

    open override func viewDidLoad() {
        super.viewDidLoad()



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


    
    }
    
    @IBAction func addParams(_ sender: UIButton) {


		if yPos == 0{

			yPos = 300

		}


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


	@IBAction func addHeaders(_ sender: UIButton) {


		if yPos == 0{

			yPos = 350

		}


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
    
    func getData(url: String) {
        var cityName = changeCityTextField.text!

		if reqLabel.text == "GET"{
			cityName.insert(contentsOf: "get", at: cityName.endIndex)

            Alamofire.request(url, method: .get, parameters: nil).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")
							let weatherJSON : JSON = JSON(response.result.value!)

							let viewControllerB = ResponseViewController()
							viewControllerB.texTry?.text = weatherJSON.rawString()
							navigationController?.pushViewController(viewControllerB, animated: true)



						//	self.performSegue(withIdentifier: "SegueID", sender: AnyObject.self)

//							let storyboard = UIStoryboard(name: "Main", bundle: nil)
//							let destVC = storyboard.instantiateViewController(withIdentifier: "modu") as! ResponseViewController
//
//							destVC.texTry?.text = weatherJSON.rawString()

							//self.performSegue(withIdentifier: "SegueID", sender: AnyObject.self)
						Manager.messageText.append(weatherJSON.rawString() ?? "ete")




							//self.texTry.text = weatherJSON.rawString()
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
            
    //        let httpHeaders: HTTPHeaders = [
    //            "Authorization": "Basic MY_BASIC_AUTH_STRING"
    //        ]
            
            
            Alamofire.request(url, method: .post, parameters: params).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")


							let weatherJSON : JSON = JSON(response.result.value!)
                          //  self.texTry.text = weatherJSON.rawString()
                            
                        }
                        else {
                           
                            print("Error \(String(describing: response.result.error))")
                         //   self.cityLabel.text = "Issue in connection"
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
    
   

    
    //Write the PrepareForSegue Method here
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueID" {
          let destinationVC = segue.destination as! ResponseViewController
			//destinationVC.texTry.text =
            
        }
    }
    
	struct ResponseP {
		let rep: JSON

	}
    
}



