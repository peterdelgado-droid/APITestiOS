//
//  SheetView.swift
//  APItest
//
//  Created by Peter Delgado on 20/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//
import Combine



import SwiftUI
@available(iOS 15.0, *)
struct SheetView: View {

	var externalSwitch: UILabel


    @State private var isPresented = false
    @State var reqMethod: String?
    @State var buttonText = "GET"
    @State private var showSheet = false
    

var body: some View {

	VStack(spacing: 0)
		{
			Button() {

				self.isPresented = true
			}label: {
				ZStack {
					Image("custom.plus")
						.resizable()
						.frame(width: 35.0, height: 35.0)
					Text("")
				}
			}

			.foregroundColor(.white) .background(Color.teal).padding(.top, -5).padding(.horizontal, 170).sheet(isPresented: $isPresented) {

						Color.teal
                                .overlay(
                            VStack(spacing: 0)
                            {
                                Text("GET").onTapGesture {

									externalSwitch.text = "GET"
									self.buttonText = "GET"
									self.isPresented = false

								}.padding(.top, 50).font(.largeTitle)
                                
                                Text("POST").onTapGesture {
                                    self.buttonText = "POST"
                                    self.isPresented = false
                                    }.font(.largeTitle)
                                Text("PUT").onTapGesture {
									self.buttonText = "PUT"
									self.isPresented = false

								}.font(.largeTitle)
                                
                                Text("DELETE").onTapGesture { print("One")
									self.buttonText = "DELETE"
									self.isPresented = false


								}.font(.largeTitle)
                                Text("PATCH").onTapGesture {
									self.buttonText = "PATCH"
									self.isPresented = false

									 }.font(.largeTitle)
                                Spacer()
                                
                                
							})}
                            }

               
    }




}


        
        
        
   




//struct SheetView_Previews: PreviewProvider {
//    
//    @available(iOS 13.0, *)
//    static var previews: some View {
//        if #available(iOS 15.0, *) {
//            SheetView(e)
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//}
