

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

	


    //Constants
    let TEST_URL = "https://httpbin.org/get"
    let APP_ID = "34434da02b9d2c06f7194ac16cd8c4f0"
  


  //  let contentView = UIHostingController
       
    
    //TODO: Declare instance variables here
    //let locationManager = CLLocationManager()
    
    
    //Pre-linked IBOutlets
   
    @IBOutlet weak var texTry: UITextView!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var sendParamsKeyTextField: UITextField!
    @IBOutlet weak var sendParamsValueTextField: UITextField!
    
    @IBOutlet weak var tabG: UITabBar!
    
     var StringTest: String!
    
    
    @IBOutlet weak var BottomViewContainer: UIView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()

		let swiftUIToggler = SheetView(externalSwitch: reqLabel)

		let content = UIHostingController(rootView:swiftUIToggler)

		addChild(content)

        view.addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
        content.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 166).isActive = true
        content.view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        content.view.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        content.view.backgroundColor = .systemTeal
        content.view.layer.cornerRadius = 5

//	updateButton()
      //  updateButton2()
    
    }
    
    
    func updateButton(){

		let tabbarVC = UITabBarController()
		let vc1 = FirstViewController()
		let vc2 = SecondVC()
		tabbarVC.setViewControllers([vc1,vc2], animated: false)


		present(tabbarVC,animated: true)



	//	tabbarVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true


//		let buttonNow = UIButton(configuration: .filled(), primaryAction:.init(handler:{ _ in
//
////        let storyboard = UIStoryboard(name: "Sheet", bundle:nil)
////        let sheetPresentationController =
////        storyboard.instantiateViewController(withIdentifier: "SheetViewController")
////        as! SheetViewController
////       self.present(sheetPresentationController,animated:true, completion:nil)
//
//    }))

		//view.addSubview(buttonNow)
    
    

    //      setupContraints()
//
//    buttonNow.translatesAutoresizingMaskIntoConstraints = false
//    buttonNow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
//    buttonNow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
//    buttonNow.heightAnchor.constraint(equalToConstant: 0).isActive = true
//    buttonNow.widthAnchor.constraint(equalToConstant: 0).isActive = true
//
    
    }
    
   
//	class SecondVC: UIViewController{
//		override func viewDidLoad(){
//			super.viewDidLoad()
//			view.backgroundColor = .clear
//			title = "Home"
//		}
//
//	}
//
//
//	class ThirdVC: UIViewController{
//		override func viewDidLoad(){
//			super.viewDidLoad()
//			view.backgroundColor = .clear
//			title = "GraphQL"
//		}
//
//	}

    
    @IBAction func open(_ sender: UIButton) {
        

    }
    
    
    func getData(url: String) {
        var cityName = changeCityTextField.text!

        if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "GET" {
            cityName.insert(contentsOf: "get", at: cityName.endIndex)

            Alamofire.request(url, method: .get, parameters: nil).responseJSON { [self]
                        response in
                        if response.result.isSuccess {
                            print("Success")
                            
                            let weatherJSON : JSON = JSON(response.result.value!)
                            self.texTry.text = weatherJSON.rawString()
                            
                        }
                        else {
                            print("Error \(String(describing: response.result.error))")
                         //   self.cityLabel.text = "Issue in connection"
                        }
                    }

        
        }else if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "POST" {
        
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
                            self.texTry.text = weatherJSON.rawString()
                            
                        }
                        else {
                           
                            print("Error \(String(describing: response.result.error))")
                         //   self.cityLabel.text = "Issue in connection"
                        }
                }
        }else if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "DELETE"{
            cityName.insert(contentsOf: "delete", at: cityName.endIndex)
        Alamofire.request(url, method: .delete, parameters: nil).responseJSON { [self]
                    response in
                    if response.result.isSuccess {
                        print("Success")
                        
                        let weatherJSON : JSON = JSON(response.result.value!)
                        self.texTry.text = weatherJSON.rawString()
                        
                    }
                    else {
                       
                        print("Error \(String(describing: response.result.error))")
                     //   self.cityLabel.text = "Issue in connection"
                    }
        
        
        }
   
        }
        else if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "PUT"{
            cityName.insert(contentsOf: "post", at: cityName.endIndex)
            let keyParam = sendParamsKeyTextField.text!
            let valueParam = sendParamsValueTextField.text!
            let params : [String: String] = [keyParam: valueParam]
            
            
            Alamofire.request(url, method: .put, parameters: params).responseJSON { [self]
                    response in
                    if response.result.isSuccess {
                        print("Success")
                        
                        let weatherJSON : JSON = JSON(response.result.value!)
                        self.texTry.text = weatherJSON.rawString()
                        
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
        var cityName = changeCityTextField.text!
       
        
        if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "GET" {
            cityName.insert(contentsOf: "get", at: cityName.endIndex)
            
        }else if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "POST" || segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "PUT" {
  
           
            
        
        }
        
       
       
        //2 If we have a delegate set, call the method userEnteredANewCityName
        getData(url: cityName)
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        
    }
    
   

    
    //Write the PrepareForSegue Method here
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
          //  let destinationVC = segue.destination as! ChangeCityViewController
         //   destinationVC.delegate = self
            
        }
    }
    
    
    
    
}



