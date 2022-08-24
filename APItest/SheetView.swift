////
////  SheetView.swift
////  APItest
////
////  Created by Peter Delgado on 20/5/22.
////  Copyright © 2022 London App Brewery. All rights reserved.
////
//import Combine
//import SwiftUI
//
//
//@available(iOS 15.0, *)
//
//struct SheetView: View {
//
//	var externalSwitch: UILabel
//	var reqLabel: UILabel?
//	let detents: [UISheetPresentationController.Detent]
//
//	init(
//
//		detents: [UISheetPresentationController.Detent] = [.medium()]
//
//	) {
//
//		self.detents = detents
////
//	}
//
//    @State private var isPresented = false
//    @State var reqMethod: String?
//    @State var buttonText = "GET"
//    @State private var showSheet = false
//	@State private var settingsDetent =
//
//    
//
//var body: some View {
//
//	VStack(spacing: 0)
//		{
//			Button() {
//
//				self.isPresented = true
//			}label: {
//				ZStack {
//					Image("custom.plus")
//						.resizable()
//						.frame(width: 35.0, height: 35.0)
//					Text("")
//				}
//			}
//
//			.sheet(isPresented: $isPresented){
//
//
//				Spacer().presentationDetents([.medium, .large], selection: $settingsDetent)
//
//				Color.clear
//                                .overlay(
//                            VStack(spacing: 0)
//                            {
//								Text("GET").foregroundColor(.green).onTapGesture {
//
//									externalSwitch.text = "GET"
//									self.isPresented = false
//
//								}.padding(.top, 50).font(.largeTitle)
//                                
//                                Text("POST").onTapGesture {
//									externalSwitch.text = "POST"
//                                    self.isPresented = false
//                                    }.font(.largeTitle)
//								Text("PUT").foregroundColor(.orange).onTapGesture {
//									externalSwitch.text = "PUT"
//
//									self.isPresented = false
//
//								}.font(.largeTitle)
//                                
//								Text("DELETE").foregroundColor(.red).onTapGesture { print("One")
//									externalSwitch.text = "DELETE"
//									self.isPresented = false
//
//
//								}.font(.largeTitle)
//								Text("PATCH").foregroundColor(.brown).onTapGesture {
//									externalSwitch.text = "PATCH"
//									self.isPresented = false
//
//									 }.font(.largeTitle)
//                                Spacer()
//								Text("").foregroundColor(.pink).onTapGesture {
//									externalSwitch.text = "PATCH"
//									self.isPresented = false
//
//								}.font(.largeTitle)
//									ZStack {
//										Image("graphql-icon")
//											.resizable()
//											.frame(width: 35.0, height: 35.0)
//
//
//									}
//
//								Text("GraphQL")
//							})}
//                            }
//
//               
//    }
//
//
//
//
//}
//
//
//        
//        
//        
//   
//
//
//
//
////struct SheetView_Previews: PreviewProvider {
////	var reqLabel: UILabel?
////    @available(iOS 13.0, *)
////    static var previews: some View {
////        if #available(iOS 15.0, *) {
////
////			SheetView(externalSwitch:reqLabel ?? "test")
////        } else {
////            // Fallback on earlier versions
////        }
////    }
////}
