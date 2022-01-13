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
	
	lazy var profilePictureView = makeViewForProfilePicture()
	lazy var profilePicture = makeProfilePictureImageView(profilePictureView: profilePictureView)
	
	lazy var activityIndicator = makeActivityIndicator()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		switch userData {
		case .loading(_), .initialisation:
			_updateView(userData: nil, isHidden: true)
		case .success(let success):
			_updateView(userData: success, isHidden: false)
		case .failure(_):
			break
		}
	}
	
	private func _updateView(userData: ViewData.UserData?, isHidden: Bool) {
		if let userData = userData {
			activityIndicator.stopAnimating()
			activityIndicator.isHidden = true

			let pictureURL = URL(string: userData.pictureLink!)
			profilePicture.download(from: pictureURL!)
			profilePicture.isHidden = false
		} else {
			if (isHidden) {
				profilePicture.isHidden = true
				
				activityIndicator.isHidden = false
				activityIndicator.startAnimating()
			}
		}
	}
}
