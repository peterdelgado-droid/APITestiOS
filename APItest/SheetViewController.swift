//
//  SheetViewController.swift
//  APItest
//
//  Created by Peter Delgado on 19/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 15.0, *)
class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    override var sheetPresentationController: UISheetPresentationController{
        presentationController as! UISheetPresentationController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium(),
                .large()
        ]
        
        makeLabels()
    }
    
    func makeLabels(){
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
        button.translatesAutoresizingMaskIntoConstraints = true
        button.leftAnchor.constraint(equalTo: 500).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
   
    }
    
    
    
}
