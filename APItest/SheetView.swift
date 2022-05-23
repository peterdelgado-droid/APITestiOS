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
    var body: some View {
        
        
        
        Button(self.buttonText) {
               //do action
        }.sheet(isPresented: $isPresented) { {
            Text("SIGN IN")
                .frame(width: 130 , height: 50, alignment: .center)
                //You need to change height & width as per your requirement
        }()
         .background(Color.blue)
         .foregroundColor(Color.white)
         .clipShape(Capsule())
        
        }
        
        
        
        
        
        Button(self.buttonText) {
                        self.isPresented = true
                    }.foregroundColor(.white).background(Color.teal).buttonStyle(PlainButtonStyle()).sheet(isPresented: $isPresented) {
                    Color.teal
                                .overlay(
                            VStack(spacing: 0)
                            {
                                Text("GET").onTapGesture { print("One") }.padding(.top, 50).font(.largeTitle)
                                
                                Text("POST").onTapGesture {
                                    self.buttonText = "POST"
                                    self.isPresented = false
                                    }.font(.largeTitle)
                                Text("PUT").onTapGesture { print("One") }
                                .font(.largeTitle)
                                
                                Text("DELETE").onTapGesture { print("One") }
                                .font(.largeTitle)
                                Text("PATCH").onTapGesture { print("One") }
                                .font(.largeTitle)
                                Spacer()
                                
                                
                            })
                            
                            
                            
                            
                        
                        
                        
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
