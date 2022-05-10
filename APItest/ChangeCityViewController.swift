//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Omid on 23/08/2016.


import UIKit
import SwiftyJSON



//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}


class ChangeCityViewController: UIViewController {
    
    var delegate : ChangeCityDelegate?
    
    
    
    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var recieveJson: UIScrollView!
    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    
    
    
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)

        self.dismiss(animated: true, completion: nil)
        
    }
    
     func updateData(json : JSON) {
    
         var WEATHER_URL =  json
         
      //   JSON(rawValue: (WEATHER_URL = recieveJson)) ?? <#default value#>
         }

    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
        
    }
    
}
