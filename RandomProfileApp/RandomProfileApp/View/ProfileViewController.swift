//
//  ViewController.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import UIKit

class ProfileViewController: UIViewController {

	private var viewModel: ProfileViewModelProtocol!
	
	init(viewModel: ProfileViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		viewModel.fetchUserData()
		viewModel.updateUserData = { viewData in
			print("ViewData")
		}
		// Do any additional setup after loading the view.
	}

}

