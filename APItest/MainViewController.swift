

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftUI
import FloatingPanel
import MGSelector


fileprivate struct HeaderKeys: MGSelectorOption {
    var title: String
    var detail: String?
}

fileprivate struct Const {
    static let keys = ["GET", "POST", "PUT", "DELETE"]
}

@available(iOS 15.0, *)
class MainViewController: UIViewController, MGSelectable {
    
    
    func didSelect(option: MGSelectorOption) {
        
        self.openSelector(title: "Header Keys", options: Const.keys.map { HeaderKeys(title: $0, detail: NSLocalizedString($0, comment: "")) }, theme: .dark)
        
    }
    
    var fpc: FloatingPanelController!
    
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
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
//UIHostingController(rootView: SwiftUIView())
//      addChild(contentView)
 //   view.addSubview(contentView.view)
      //  setupConstraints()
        
        
        
        
    }
    
 //   fileprivate func setupConstraints(){
 //       contentView.view.translatesAutoresizingMaskIntoConstraints = false;        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = false
//        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//7        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 //7       contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        

//    }
    
    //MARK: - Networking
    /***************************************************************/
    
    
    //2
    
    
    
    @IBAction func open(_ sender: UIButton) {
        self.openSelector(title: "", options: Const.keys.map { HeaderKeys(title: $0, detail: NSLocalizedString($0, comment: "")) }, theme: .light)
       
        
        
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
    
  /*  @IBAction func presentModal() {
        let detailViewController = MainViewController()
        let nav = UINavigationController(rootViewController: detailViewController)
        // 1
        nav.modalPresentationStyle = .pageSheet
       
        
        // 2
        if let sheet = nav.sheetPresentationController {
                
                // 3
            
                sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            
            
            
            // MARK: - Presentation Delegate
               func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
                   self.view.alpha = 1.0
               }
            
        }else {
            // Fallback on earlier versions
        }
        // 4
        present(nav, animated: true, completion: nil)

        
        
        let medium = UIBarButtonItem(title: "Medium", primaryAction: .init(handler: { _ in
            if let sheet = nav.sheetPresentationController {
                // 2
                sheet.animateChanges {

                    // 3
                    sheet.selectedDetentIdentifier = .medium

                }
            }
        }))
        detailViewController.navigationItem.leftBarButtonItem = medium
        
        }
    
   */
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
          //  let destinationVC = segue.destination as! ChangeCityViewController
         //   destinationVC.delegate = self
            
        }
    }
    
    
    
    
}



