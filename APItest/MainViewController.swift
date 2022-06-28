

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

@available(iOS 15.0, *)
open class MainViewController: UIViewController{

	private let stackScrollView = StackScrollView()

	var viewController1: UIViewController!
	var viewController2: UIViewController!
	var valueP:String!


	var passedValue:String!
	var passedValue2:String!

	@IBOutlet var reqLabel: UILabel!


//	@IBOutlet weak private var stackView: UIStackView!

	let xPos : CGFloat = 0
	var yPos : CGFloat = 0
	let xPos2 : CGFloat = 0
	var yPos2 : CGFloat = 0
	let xPos3 : CGFloat = 0
	var yPos3 : CGFloat = 0
	let xPos4 : CGFloat = 0
	var yPos4 : CGFloat = 0

	let rect = CGRect(x: 5, y: 300, width: 350, height: 300)

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var sendParamsKeyTextField: UITextField!
    @IBOutlet weak var sendParamsValueTextField: UITextField!
	@IBOutlet weak var addParams: UIButton!
	@IBOutlet weak var addHeaders: UIButton!
	@IBOutlet weak var Headers: UILabel!



	@IBOutlet weak var closeIcon: UIButton!

    
     var StringTest: String!
	 let customSeg = CustomSegmentedControl()


	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	open override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		

	}





    open override func viewDidLoad() {
        super.viewDidLoad()



		var views: [UIView] = []


		//views.append(HeaderStackCell(title: "ButtonStackCell", backgroundColor: UIColor.blue))



		let makeRemovableButton: () -> [UIView] = {

			let s = self.fullSeparator()

			var views: [UIView] = []
			views.append(s)

			views.append({
				let v = ButtonStackCell(buttonTitle: "Remove")
				
				v.tapped = { [unowned v] in
					v.remove()
					s.remove()
				}
				return v
			}())
			return views
		}


//		views.append(contentsOf: { () -> [UIView] in
//			let s = fullSeparator()
//			let v = ButtonStackCell(buttonTitle: "Insert Before")
//			v.tapped = { [unowned stackScrollView, unowned s] in
//				let views = (0 ... .random(in: 1 ... 2)).flatMap { _ in makeRemovableButton() }
//				stackScrollView.insert(views: views, before: s, animated: true)
//			}
//			return [s, v]
//		}())

//		views.append({
//			let v = TextFieldStackCell()
//			v.set(placeholder: "Detail")
//			return v
//		}())

		views.append(contentsOf: { () -> [UIView] in
			let v = ButtonStackCell(buttonTitle: "")
			v.tapped = { [unowned stackScrollView, unowned v] in
				let views = (0 ... .random(in: 0 ... 0)).flatMap { _ in makeRemovableButton() }
				stackScrollView.insert(views: views, after: v, animated: true)
			}
			return [v]
		}())

		stackScrollView.append(views: views)

		stackScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		stackScrollView.frame = rect


		view.addSubview(stackScrollView)
//		stackScrollView.translatesAutoresizingMaskIntoConstraints = false
//		stackScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
//		stackScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true

//if(passedValue == nil){
//			closeIcon?.isHidden = true
//
//		}
//		changeCityTextField?.text = passedValue
//
//
//		scrollView?.contentSize = (CGSize(width: 500, height: 500))
//
//
		let swiftUIToggler = SheetView(externalSwitch: reqLabel)
		let content = UIHostingController(rootView:swiftUIToggler)

		addChild(content)

		view.addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        content.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        content.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        content.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        content.view.widthAnchor.constraint(equalToConstant: 110).isActive = true
		content.view.backgroundColor = .clear
        content.view.layer.cornerRadius = 5
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


	private func fullSeparator() -> SeparatorStackCell {
		return SeparatorStackCell(leftMargin: 0, rightMargin: 0, backgroundColor: .clear, separatorColor: UIColor(white: 0.90, alpha: 1))
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
			//cityName.insert(contentsOf: "get", at: cityName.endIndex)

			let v = ButtonStackCell(buttonTitle: "")
			view.addSubview(v)
			let keyParam = v.paramsKey
			let valueParam = v.textfieldParamsValue.text!
			let params : [String: String] = [keyParam: valueParam]




			Alamofire.request(url, method: .get, parameters: params).responseJSON { [self]
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
