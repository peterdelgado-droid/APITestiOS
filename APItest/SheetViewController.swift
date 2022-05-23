//
//  SheetViewController.swift
//  APItest
//
//  Created by Peter Delgado on 19/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

@available(iOS 15.0, *)
class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    
    @IBOutlet weak var newButton: UIButton!
    
    @IBAction func newButton(_ sender: UIButton) {
        
        
    }
    
    
    
    override var sheetPresentationController: UISheetPresentationController{
        presentationController as! UISheetPresentationController
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
//        parent?.view.addSubview(child.view)
//        parent?.addChild(child)
//        child.didMove(toParent: parent)
//
//
        
        view.backgroundColor = .systemTeal
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [
            .medium(),
                .large()
        ]
        
        let contentView = UIHostingController(rootView: SheetView())
        addChild(contentView)
        view.addSubview(contentView.view)
        
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        makeLabels()
     //   makeLabels2()
    }
    
//        fileprivate func setupContraints(){
//        contentView.view.translatesAutoresizingMaskIntoConstraints = false
//        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//
//            }
    
    func makeLabels(){
        
        
    
        //      setupContraints()
//     button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 2).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 100).isActive = true

       
   
    }
    func makeLabels2(){
        
        let button2 = UIButton(configuration: .filled(), primaryAction:.init(handler:{ _ in
            
            let storyboard = UIStoryboard(name: "Sheet", bundle:nil)
            let sheetPresentationController =
            storyboard.instantiateViewController(withIdentifier: "SheetViewController")
            as! SheetViewController
            self.present(sheetPresentationController,animated:true, completion:nil)
            
        }))
        
        button2.setTitle("POST", for: .normal)
        button2.configuration?.cornerStyle = .capsule
    
        //      setupContraints()
     button2.translatesAutoresizingMaskIntoConstraints = false
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 3).isActive = true
        button2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -145).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
}
