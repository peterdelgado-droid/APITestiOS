//
//  SettingsSwiftUIView.swift
//  APItest
//
//  Created by Peter Delgado on 7/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import SwiftUI

struct SettingsSwiftUIView: View {
	



	var body: some View {

//		do {
//			try <#throwing expression#>
//		} catch <#pattern#> {
//			<#statements#>
//		}


		VStack {
			Button() {


			}label: {
				ZStack {
					Image("play.fill")
						.resizable()
						.frame(width: 35.0, height: 35.0)
					Text("")
				}
			}


				TextEditor(text: $searchText)
					.foregroundColor(Color(.tertiaryLabel))

			




		}






    }
}

struct SettingsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSwiftUIView()
    }
}
