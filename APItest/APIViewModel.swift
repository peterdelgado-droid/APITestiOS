//
//  APIViewModel.swift
//  APItest
//
//  Created by Peter Delgado on 13/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
import Combine
import UIKit
import CoreData
import SwiftUI


class APIViewModel: ObservableObject{


	@Published var url: [ResponseModel] = []
	@Published var reqMethod: [ResponseModel] = []

	@Published var allCharacters: [ResponseModel] = []
	var urlArray = CurrentValueSubject<[Manager], Error> ([Manager]())
	//var reqMetArray : Array? = []

	private var cancellables = Set<AnyCancellable>()

	let fetchResults = CoreDataNow()
	var subsricption = Set<AnyCancellable>()
	@Published var searchText: String = ""

	init(){
		dataResponseSubscribe()
	}



	func dataResponseSubscribe(){

		fetchResults.$savedEntities
			.combineLatest($url)
			.map(mapCharactersAndFilterByText)
			.sink { [weak self] (characters) in
				guard let self = self else { return }
				self.allCharacters = characters
			}
			.store(in: &cancellables)
	}


	private func mapCharactersAndFilterByText(favoritiesEntities: [Entity],  characters: [ResponseModel]) -> [ResponseModel] {

		var characters = characters.map{ (character) -> ResponseModel in
			var character = character;
			guard favoritiesEntities.first(where: { $0.url == character.url

				
			}) != nil else {
				return character;
			}
			character.toggleFavorite();
			return character;
		}

		
		return characters;

	}














	
}


