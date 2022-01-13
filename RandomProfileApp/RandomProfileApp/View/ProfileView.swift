//
//  Profileview.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import UIKit

class ProfileView: UIView {
	
	var userData: ViewData = .initialisation {
		didSet {
			setNeedsLayout()
		}
	}

	private var _isIconsConstraintsActive = false
	
	lazy var viewOfProfilePictureView = makeViewForProfilePictureView()
	lazy var profilePictureView = makeViewForProfilePicture(superView: viewOfProfilePictureView)
	lazy var profilePicture = makeProfilePictureImageView(superView: profilePictureView)
	
	lazy var activityIndicator = makeActivityIndicator()
	
	lazy var locationImageView = makeIconImageView(withName: "location.fill")
	lazy var emailImageView = makeIconImageView(withName: "envelope.fill")
	lazy var ageImageView = makeIconImageView(withName: "face.dashed.fill")
	lazy var genderImageView = makeIconImageView(withName: "person.fill")
	
	lazy var nameLabel = makeNameLabel()
	
	lazy var locationLabel = makeLocationLabel()
	lazy var emailLabel = makeEmailLabel()
	lazy var ageLabel = makeAgeLabel()
	lazy var genderLabel = makeGenderLabel()

	lazy var errorLabel = makeErrorLabel()
	
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		switch userData {
		case .loading(_), .initialisation:
			_updateView(userData: nil, isHidden: true)
		case .success(let success):
			_updateView(userData: success, isHidden: false)
		case .failure(_):
			_updateView(userData: nil, isHidden: false)
		}
	}
	
	private func _updateView(userData: ViewData.UserData?, isHidden: Bool) {
		
		_setConstraints()
		
		if let userData = userData {
			_setLabelsAndProfileImage(userData: userData)
			_changeViewsVisibility(isHidden: isHidden)
			activityIndicator.stopAnimating()
		} else {
			if (isHidden) {
				_changeViewsVisibility(isHidden: isHidden)
				activityIndicator.startAnimating()
			} else {
				activityIndicator.stopAnimating()
				_changeViewsVisibility(isHidden: true)
				activityIndicator.isHidden = true
				errorLabel.isHidden = false
			}
		}
	}
	
	private func _setConstraints() {
		if (_isIconsConstraintsActive == false) {
			_setIconsConstreints()
			_setNameLabelConstraints()
			_setLabelsConstreints()
			_isIconsConstraintsActive = true
		}
	}
	
	private func _setLabelsAndProfileImage(userData: ViewData.UserData) {
		if let pictureURL = URL(string: userData.pictureLink ?? "") {
			profilePicture.download(from: pictureURL)
		} else {
			profilePicture.image = UIImage(systemName: "questionmark.circle")
		}

		nameLabel.text = userData.name!
		genderLabel.text = userData.gender!
		emailLabel.text = userData.email!
		locationLabel.text = userData.location!
		ageLabel.text = userData.age!
	}
	
	private func _changeViewsVisibility(isHidden: Bool) {
		errorLabel.isHidden = true
		viewOfProfilePictureView.isHidden = isHidden
		profilePicture.isHidden = isHidden
		nameLabel.isHidden = isHidden
		genderImageView.isHidden = isHidden
		emailImageView.isHidden = isHidden
		locationImageView.isHidden = isHidden
		ageImageView.isHidden = isHidden
		locationLabel.isHidden = isHidden
		emailLabel.isHidden = isHidden
		ageLabel.isHidden = isHidden
		genderLabel.isHidden = isHidden
		activityIndicator.isHidden = !isHidden
	}
}
