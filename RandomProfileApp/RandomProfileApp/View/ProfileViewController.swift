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
		view.backgroundColor = .blue
		_createProfileView()
		_setRefreshBarButton()
		viewModel.fetchUserData()
		viewModel.updateUserData = { [weak self] viewData in
			self?.profileView.userData = viewData
		}
	}
	
	private func _createProfileView() {
		profileView = ProfileView()
		profileView.translatesAutoresizingMaskIntoConstraints = false
		profileView.backgroundColor = .green
		view.addSubview(profileView)
		NSLayoutConstraint.activate([
			profileView.leftAnchor.constraint(equalTo: view.leftAnchor),
			profileView.rightAnchor.constraint(equalTo: view.rightAnchor),
			profileView.topAnchor.constraint(equalTo: view.topAnchor),
			profileView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.6)
		])
	}
	
	private func _setRefreshBarButton() {
		let barButton = UIBarButtonItem(barButtonSystemItem: .refresh,
										target: self,
										action:  #selector(_loadNewProfile))
		navigationItem.rightBarButtonItem = barButton
	}
	
	@objc private func _loadNewProfile() {
		viewModel.fetchUserData()
	}
}

