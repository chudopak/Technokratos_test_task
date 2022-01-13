//
//  ProfileView+Extension.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import UIKit

extension ProfileView {
	
	func makeProfilePictureImageView(profilePictureView: UIView) -> UIImageView {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		profilePictureView.addSubview(imageView)
		imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: profilePictureViewSize).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: profilePictureViewSize).isActive = true
		return (imageView)
	}
	
	func makeViewForProfilePicture() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		addSubview(view)
		NSLayoutConstraint.activate([
			view.centerXAnchor.constraint(equalTo: centerXAnchor),
			view.centerYAnchor.constraint(equalTo: centerYAnchor),
			view.widthAnchor.constraint(equalToConstant: profilePictureViewSize),
			view.heightAnchor.constraint(equalToConstant: profilePictureViewSize)
		])
		view.layer.cornerRadius = profilePictureViewSize * 0.5
		view.clipsToBounds = true
		return (view)
	}
	
	func makeActivityIndicator() -> UIActivityIndicatorView {
		let indicator = UIActivityIndicatorView(style: .large)
		indicator.color = .gray
		indicator.hidesWhenStopped = true
		indicator.translatesAutoresizingMaskIntoConstraints = false
		addSubview(indicator)
		indicator.isHidden = true
		NSLayoutConstraint.activate([
			indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
			indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
			indicator.widthAnchor.constraint(equalToConstant: activityIndicatorSize),
			indicator.heightAnchor.constraint(equalToConstant: activityIndicatorSize)
		])
		return (indicator)
	}
}
