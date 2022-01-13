//
//  ViewController.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import UIKit

class ProfileViewController: UIViewController {

	private var viewModel: ProfileViewModelProtocol!
	private var profileView: ProfileView!
	
	init(viewModel: ProfileViewModelProtocol) {
		super.init(nibName: nil, bundle: nil)
		self.viewModel = viewModel
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		_setViewControllerColors()
		_createProfileView()
		_setNavigationBar()
		
		viewModel.fetchUserData()
		viewModel.updateUserData = { [weak self] viewData in
			self?.profileView.userData = viewData
		}
	}
	
	private func _createProfileView() {
		profileView = ProfileView()
		profileView.translatesAutoresizingMaskIntoConstraints = false
		profileView.backgroundColor = adaptiveBackgroundColor
		view.addSubview(profileView)
		
		NSLayoutConstraint.activate([
			profileView.leftAnchor.constraint(equalTo: view.leftAnchor),
			profileView.rightAnchor.constraint(equalTo: view.rightAnchor),
			profileView.topAnchor.constraint(equalTo: view.topAnchor),
			profileView.heightAnchor.constraint(equalToConstant: profileViewSize)
		])
	}
	
	private func _setRefreshBarButton() {
		let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"),
											style: .done,
											target: self,
											action: #selector(_loadNewProfile))
		refreshButton.tintColor = adaptiveBarButtonColor
		navigationItem.rightBarButtonItem = refreshButton
	}
	
	private func _setNavigationBar() {
		_setRefreshBarButton()
		navigationController?.navigationBar.barTintColor = adaptiveNavigationBarColor
	}
	
	private func _setViewControllerColors() {
		view.backgroundColor = adaptiveBackgroundColor
		view.tintColor = adaptiveTintColor
	}
	
	@objc private func _loadNewProfile() {
		viewModel.fetchUserData()
	}
}

