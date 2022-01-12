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
	
	lazy var profilePicture = makeImageView()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		switch userData {
		case .initialisation:
			break
		case .loading(_):
			break
		case .success(let success):
			_update(userData: success, isHidden: false)
		case .failure(_):
			break
		}
	}
	
	private func _update(userData: ViewData.UserData?, isHidden: Bool) {
		if let userData = userData {
			let pictureURL = URL(string: userData.pictureLink!)
			profilePicture.download(from: pictureURL!)
		}
	}
}
