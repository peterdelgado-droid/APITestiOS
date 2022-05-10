

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftUI

@available(iOS 13.0, *)
class MainViewController: UIViewController, CLLocationManagerDelegate{
    
    //Constants
    let TEST_URL = "https://httpbin.org/get"
    //let APP_ID = "34434da02b9d2c06f7194ac16cd8c4f0"
  
    

    let contentView = UIHostingController(rootView:newSwift())
    
    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    
    //Pre-linked IBOutlets
   
    @IBOutlet weak var texTry: UITextView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    fileprivate func setupConstraints(){
        contentView.view.translatesAutoresizingMaskIntoConstraints = false;        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = false
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        

    }
    
    //MARK: - Networking
    /***************************************************************/
    
    
    
    func getData(url: String, parameters: [String : String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { [self]
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
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            getData(url: TEST_URL, parameters: params)
        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
     //   cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    @IBOutlet weak var changeCityTextField: UITextField!

    @IBAction func getPressed(_ sender: AnyObject) {
        
        
        
        //1 Get the city name the user entered in the text field
        var cityName = changeCityTextField.text!
        
        if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "GET" {
            cityName.insert(contentsOf: "get", at: cityName.endIndex)
            
        }else if segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "POST" || segControl.titleForSegment(at: segControl.selectedSegmentIndex) == "PUT" {
  
            /*
             If the server uses consumer key and consumer secret, uncomment the follow lines
             */
            
            let params: Parameters = [
    //            "consumer_key": "MY_CONSUMER_KEY",
    //            "consumer_secret": "MY_CONSUMER_SECRET",
                "name": "Jack",
                "salary": "3540",
                "age": "23"
            ]
            
            /*
             If you are using Basic Authentication uncomment the follow line and add your base64 string
             Replace 'nil' with 'httpHeaders' in headers
             */
            
    //        let httpHeaders: HTTPHeaders = [
    //            "Authorization": "Basic MY_BASIC_AUTH_STRING"
    //        ]
            
            Alamofire.request("http://dummy.restapiexample.com/api/v1/create", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }
                    
                    //self.openDetailsVC(jsonString: prettyPrintedJson, title: "POST METHOD")
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
            
        
        }
        
       
        let params : [String: String] = ["q" : APP_ID, "appid" : APP_ID]
        //2 If we have a delegate set, call the method userEnteredANewCityName
        getData(url: cityName, parameters: params)
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredANewCityName(city: String) {
        
let params : [String: String] = ["q" : city, "appid" : APP_ID]
        let cityName = changeCityTextField.text!

        getData(url: cityName, parameters: params)
        
    }

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
          //  let destinationVC = segue.destination as! ChangeCityViewController
         //   destinationVC.delegate = self
            
        }
    }
    
    
    
    
}


