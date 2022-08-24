//
//  BaseViewModel.swift
//  APItest
//
//  Created by Peter Delgado on 1/7/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import RxSwift
import RxAlertViewable
import RxController

class BaseViewModel: RxViewModel {

	let alert = PublishSubject<RxAlert>()
	let actionSheet = PublishSubject<RxActionSheet>()
	let loading = PublishSubject<Bool>()

}
