//
//  BaseViewController.swift
//  APItest
//
//  Created by Peter Delgado on 1/7/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import NVActivityIndicatorView
import SwipeBack
import RxAlertViewable
import RxSwift
import RxCocoa
import RxController
import RxBinding

class BaseViewController<ViewModel: BaseViewModel>: RxViewController<ViewModel> {

	var lastBarTintColor: UIColor? = nil
	var currentBarColor: UIColor? = nil {
		didSet {
			lastBarTintColor = navigationController?.navigationBar.barTintColor
		}
	}

	var isNavigationBarHidden: Bool = false {
		didSet {
			navigationController?.isNavigationBarHidden = isNavigationBarHidden
		}
	}

	/**
	 * This property indicates whether this controller is a child view controller of another controller.
	 * If the property is false, the isNavigationBarHidden property is disabled.
	 */
	var isChild: Bool {
		return false
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		disposeBag ~ [
			viewModel.alert ~> rx.alert,
			viewModel.actionSheet ~> rx.actionSheet,
		]

		if let navigationController = navigationController {
			navigationController.swipeBackEnabled = true

			if let index = navigationController.viewControllers.firstIndex(of: self), index > 0 {
				navigationItem.leftBarButtonItem = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(back))
			} else {
				navigationItem.leftBarButtonItem = nil
			}
		}

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		guard let navigationController = navigationController, !isChild else {
			return
		}
		if navigationController.isNavigationBarHidden != isNavigationBarHidden {
			navigationController.isNavigationBarHidden = isNavigationBarHidden
		}

		if let color = currentBarColor {
		}
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

		if let color = lastBarTintColor, let navigationController = navigationController, !isChild  {
			navigationController.navigationBar.barTintColor = color
		}
	}

	@objc private func back() {
		navigationController?.popViewController(animated: true)
	}

}


extension BaseViewController: RxAlertViewable {}
