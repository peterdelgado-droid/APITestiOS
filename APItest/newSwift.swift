//
//  newSwift.swift
//  Clima
//
//  Created by Peter Delgado on 29/3/22.
// 
//

import SwiftUI
@available(iOS 13.0, *)
struct newSwift: View {
   
    @State private var selectRequest = 0
    @State private var name: String = ""
    @State private var selection = 1


    @available(iOS 13.0, *)
    var body: some View {
       
        VStack(alignment: .leading) {
            
            Rectangle()
            .fill(Color.gray)
            .frame(width: 400, height: 50)
            .padding(.top, -700)
           
                        
            Text("REQUEST METHOD")
                .padding(.top, -693.0)
                .padding(.leading, 20.0)
                .multilineTextAlignment(.center)
            
            Rectangle()
            .fill(Color.gray)
            .frame(width: 400, height: 50)
            .padding(.top, -600)
            
            
            Text("SELECT REQUEST METHOD")
                .padding(.top, -593.0)
                .padding(.leading, 20.0)
                .multilineTextAlignment(.center)
            
            Rectangle()
            .fill(Color.gray)
            .frame(width: 400, height: 50)
            .padding(.top, -500)
            
            
            Text("ENTER URL")
                .padding(.top, -493.0)
                .padding(.leading, 20.0)
                .multilineTextAlignment(.center)
            
            
            if #available(iOS 14.0, *) {
                
            } else {
                // Fallback on earlier versions
            }
                
            
            
                }
        Button(action: {
                selection = (selection + 1) % 4
            }) {
                Text("Next")
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
         
            }
        
        
     TabView(selection: $selection){
         
             
            Text("")
            .padding()
        
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(0)
            Text("")
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(1)
                }
            
      }
       
        }
    
@available(iOS 13.0, *)
struct newSwift_Previews: PreviewProvider {
        static var previews: some View {
            newSwift()
        }
}
    


