

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
       }
    
    
   
    
    
   
    
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
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var tabG: UITabBar!
    
//    let contentView = UIHostingController(rootView: BottomSheetView(isOpen: true, maxHeight: 600){
//        Rectangle().fill(Color.red)
//    }) .content: self())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(configuration: .filled(), primaryAction:.init(handler:{ _ in
            
            let storyboard = UIStoryboard(name: "Sheet", bundle:nil)
            let sheetPresentationController =
            storyboard.instantiateViewController(withIdentifier: "SheetViewController")
            as! SheetViewController
            self.present(sheetPresentationController,animated:true, completion:nil)
            
        }))
        
        button.setTitle("Present Sheet", for: .normal)
        button.configuration?.cornerStyle = .capsule
        view.addSubview(button)
    
        //      setupContraints()
//
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
      
//        let fpc = FloatingPanelController()
//        let contentVC = MainViewController()
//       
//        fpc.set(contentViewController: contentVC)
//        fpc.isRemovalInteractionEnabled = true
//        fpc.addPanel(toParent: self)
        
       
       

        
        
    }
    
//    fileprivate func setupContraints(){
//            contentView.view.translatesAutoresizingMaskIntoConstraints = false
//            contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//            contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//            contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//
//        }
    
    
//    private lazy var requestMethodButton: UIButton = {
//        let button = UIButton()
//        button.contentHorizontalAlignment = .right
//        button.setTitle("GET", for: .normal)
//
//        button.setTitleColor(.white, for: .normal)
//        button.setTitleColor(.lightGray, for: .highlighted)
//        button.rx.tap.bind { [unowned self] in
//            let options = RequestConst.methods.map { DetailOption(key: $0) }
//         //   self.openSelector(title:"test", options: options, theme: .dark)
//        }
//        return button
//    }()
//
    var contentViewControllers: [UIViewController] = []

   
    
    
   
    
    @IBAction func open(_ sender: UIButton) {
        
        
         

           
//            buttonG.rx.tap.bind { [unowned self] in
//                let options = Const.keys.map { DetailOption(key: $0) }
//                self.openSelector(title: "test", options: options, theme: .dark)
//            }.dispose()
            
        
       
       
        
        
    self.openSelector(title: "Request Method", options: Const.keys.map { HeaderKeys(title: $0, detail: NSLocalizedString($0, comment: "")) }, theme: .light)

       
        
        
        
        
          
            
            
            
        
        
     /*   let titleB: () =  self.openSelector(title: "", options: Const.keys.map { HeaderKeys(title: $0, detail: NSLocalizedString($0, comment: "")) }, theme: .light)
       
        buttonG.setTitle(titleB as! String?, for: .normal)
        */
        
       
        
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
          //  let destinationVC = segue.destination as! ChangeCityViewController
         //   destinationVC.delegate = self
            
        }
    }
    
    
    
    
}



