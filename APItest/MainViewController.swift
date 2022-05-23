

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

@available(iOS 13.0, *)
public protocol MainViewControllerDelegate : NSObjectProtocol {

    
    @available(iOS 15.0, *)
    func requestMethodViewController(_ viewController: MainViewController)

    
    
}



@available(iOS 15.0, *)
open class MainViewController: UIViewController {
    weak open var delegate: MainViewControllerDelegate?
    open var selectedFontDescriptor: String?
//    @Binding var isShown: Bool
//
//       init(isShown: Binding<Bool>) {
//           _isShown = isShown
//           super.init(nibName: nil, bundle: nil)
//
//       }
    
    
//    required init?(coder: NSCoder) {
//        super.init(coder: aDecoder)
//        }
//
    
   
    

    //Constants
    let TEST_URL = "https://httpbin.org/get"
    let APP_ID = "34434da02b9d2c06f7194ac16cd8c4f0"
  
    struct Option: MGSelectorOption {
        var title: String
        var detail: String?
    }
    let options: [Option] = []

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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let content = UIHostingController(rootView: SheetView())
        addChild(content)
        view.addSubview(content.view)
        
        
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        content.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        content.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        content.view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
       // updateButton()
      //  updateButton2()
    
    }
    
    func updateButton(){
    let buttonNow = UIButton(configuration: .filled(), primaryAction:.init(handler:{ _ in
        
        let storyboard = UIStoryboard(name: "Sheet", bundle:nil)
        let sheetPresentationController =
        storyboard.instantiateViewController(withIdentifier: "SheetViewController")
        as! SheetViewController
       self.present(sheetPresentationController,animated:true, completion:nil)
        
    }))
        buttonNow.setTitle(selectedFontDescriptor, for: .normal)
    buttonNow.configuration?.cornerStyle = .capsule
     view.addSubview(buttonNow)
    
    

    //      setupContraints()
//
    buttonNow.translatesAutoresizingMaskIntoConstraints = false
    buttonNow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
    buttonNow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
    buttonNow.heightAnchor.constraint(equalToConstant: 100).isActive = true
    buttonNow.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
        buttonNow.setTitle(selectedFontDescriptor, for: .normal)
    }
    
    func updateButton2(){
    let buttonNow = UIButton(configuration: .filled(), primaryAction:.init(handler:{ _ in
        
//        let storyboard = UIStoryboard(name: "Sheet", bundle:nil)
//        let sheetPresentationController =
//        storyboard.instantiateViewController(withIdentifier: "SheetViewController")
//        as! SheetViewController
//       self.present(sheetPresentationController,animated:true, completion:nil)
        
    }))
    buttonNow.setTitle(selectedFontDescriptor, for: .normal)
    buttonNow.configuration?.cornerStyle = .capsule
     view.addSubview(buttonNow)
    
    

    //      setupContraints()
//
    buttonNow.translatesAutoresizingMaskIntoConstraints = false
    buttonNow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150).isActive = true
    buttonNow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
    buttonNow.heightAnchor.constraint(equalToConstant: 100).isActive = true
    buttonNow.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    
    }
    
   


   
    
//    fileprivate func setupContraints(){
//            contentView.view.translatesAutoresizingMaskIntoConstraints = false
//            contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//            contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//            contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//
//        }
    
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



