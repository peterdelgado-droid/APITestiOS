//
//  SheetView.swift
//  APItest
//
//  Created by Peter Delgado on 20/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import SwiftUI
@available(iOS 15.0, *)
struct SheetView: View {
    
    
    @State private var isPresented = false
    @State var reqMethod: String?
    @State var buttonText = "GET"
    @State private var showSheet = false
    



    var body: some View {
		Image("custom.cross.circle")
			.resizable()
			.frame(width: 40.0, height: 40.0)
			.padding(.top, -60)
			.padding(.horizontal, -150)



		VStack(spacing: 0)
		{
Button(self.buttonText) {
                        self.isPresented = true
                    }.foregroundColor(.white) .clipShape(Capsule()).background(Color.teal).sheet(isPresented: $isPresented) {
                    Color.teal
                                .overlay(
                            VStack(spacing: 0)
                            {
                                Text("GET").onTapGesture {

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


        
        
        
   




struct SheetView_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SheetView()
        } else {
            // Fallback on earlier versions
        }
    }
}
