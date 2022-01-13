//
//  ProfileView+Extension.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import UIKit

extension ProfileView {
	
	func makeProfilePictureImageView(superView: UIView) -> UIImageView {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		superView.addSubview(imageView)
		_setProfilePictureConstraints(for: imageView, superView: superView, withSize: profilePictureViewSize)

		return (imageView)
	}
	
	func makeViewForProfilePicture(superView: UIView) -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		superView.addSubview(view)
		_setProfilePictureConstraints(for: view, superView: superView, withSize: profilePictureViewSize)
		view.layer.cornerRadius = profilePictureViewSize * 0.5
		view.clipsToBounds = true
		return (view)
	}
	
	func makeViewForProfilePictureView() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		addSubview(view)
		_setProfilePictureSuperViewConstraints(for: view, withSize: viewOfProfilePictureViewSize)
		view.layer.cornerRadius = viewOfProfilePictureViewSize * 0.5
		view.backgroundColor = adaptivePictureCircleColor
		return (view)
	}
	
	func makeActivityIndicator() -> UIActivityIndicatorView {
		let indicator = UIActivityIndicatorView(style: .large)
		indicator.color = .gray
		indicator.hidesWhenStopped = true
		indicator.translatesAutoresizingMaskIntoConstraints = false
		addSubview(indicator)
		indicator.isHidden = true
		_setProfilePictureSuperViewConstraints(for: indicator, withSize: activityIndicatorSize)
		return (indicator)
	}
	
	func makeIconImageView(withName name: String) -> UIImageView {
		let icon = UIImageView()
		icon.translatesAutoresizingMaskIntoConstraints = false
		icon.image = UIImage(systemName: name)
		icon.tintColor = adaptiveIconsColor
		addSubview(icon)
		return (icon)
	}
	
	func makeNameLabel() -> UILabel {
		let label = makeLabel(size: 20)
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.numberOfLines = 1
		label.textAlignment = .center
		return (label)
	}
	
	func makeErrorLabel() -> UILabel {
		let label = makeLabel(size: 25)
		label.font = UIFont.boldSystemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.text = "Can not load profile"
		label.isHidden = true
		NSLayoutConstraint.activate([
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height * 0.1),
			label.leftAnchor.constraint(equalTo: leftAnchor),
			label.rightAnchor.constraint(equalTo: rightAnchor),
			label.heightAnchor.constraint(equalToConstant: 50)
		])
		return (label)
	}
	
	func makeAgeLabel() -> UILabel {
		let label = makeLabel(size: 18)
		label.numberOfLines = 1
		label.textAlignment = .right
		return (label)
	}
	
	func makeGenderLabel() -> UILabel {
		let label = makeLabel(size: 18)
		label.numberOfLines = 1
		label.textAlignment = .right
		return (label)
	}
	
	func makeEmailLabel() -> UILabel {
		let label = makeLabel(size: 18)
		label.numberOfLines = 1
		label.textAlignment = .left
		return (label)
	}
	
	func makeLocationLabel() -> UILabel {
		let label = makeLabel(size: 18)
		label.numberOfLines = 1
		label.textAlignment = .left
		return (label)
	}
	
	func makeLabel(size: CGFloat) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = adaptiveTintColor
		label.font = UIFont.systemFont(ofSize: size)
		label.adjustsFontSizeToFitWidth = true
		addSubview(label)
		return (label)
	}
	
	
	private func _setProfilePictureSuperViewConstraints(for view: UIView, withSize elementSize: CGFloat) {
		NSLayoutConstraint.activate([
			view.centerXAnchor.constraint(equalTo: centerXAnchor),
			view.topAnchor.constraint(equalTo: topAnchor, constant: profileViewSize * 0.3),
			view.widthAnchor.constraint(equalToConstant: elementSize),
			view.heightAnchor.constraint(equalToConstant: elementSize)
		])
	}
	
	private func _setProfilePictureConstraints(for view: UIView, superView: UIView, withSize elementSize: CGFloat) {
		NSLayoutConstraint.activate([
			view.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
			view.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
			view.widthAnchor.constraint(equalToConstant: elementSize),
			view.heightAnchor.constraint(equalToConstant: elementSize)
		])
	}
	
	func _setIconsConstreints() {
		
		let viewEmptyHeight = profileViewSize - 2 * iconSize - viewOfProfilePictureViewSize - nameLabelHeight
		
		NSLayoutConstraint.activate([
			genderImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -screenSideOffset),
			genderImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -viewEmptyHeight * 0.35),
			genderImageView.widthAnchor.constraint(equalToConstant: iconSize),
			genderImageView.heightAnchor.constraint(equalToConstant: iconSize)
		])
			
		NSLayoutConstraint.activate([
			ageImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -screenSideOffset),
			ageImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -viewEmptyHeight * 0.1),
			ageImageView.widthAnchor.constraint(equalToConstant: iconSize),
			ageImageView.heightAnchor.constraint(equalToConstant: iconSize)
		])
			
		NSLayoutConstraint.activate([
			emailImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: screenSideOffset),
			emailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -viewEmptyHeight * 0.1),
			emailImageView.widthAnchor.constraint(equalToConstant: iconSize),
			emailImageView.heightAnchor.constraint(equalToConstant: iconSize)
		])
			
		NSLayoutConstraint.activate([
			locationImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: screenSideOffset),
			locationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -viewEmptyHeight * 0.35),
			locationImageView.widthAnchor.constraint(equalToConstant: iconSize),
			locationImageView.heightAnchor.constraint(equalToConstant: iconSize)
		])
	}
	
	func _setNameLabelConstraints() {
		let viewEmptyHeight = profileViewSize - 2 * iconSize - viewOfProfilePictureViewSize - nameLabelHeight
		
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: viewOfProfilePictureView.bottomAnchor, constant: viewEmptyHeight * 0.015),
			nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: viewEmptyHeight * 0.1),
			nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -viewEmptyHeight * 0.1),
			nameLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
		])
	}
	
	func _setLabelsConstreints() {
		
		NSLayoutConstraint.activate([
			genderLabel.rightAnchor.constraint(equalTo: genderImageView.leftAnchor, constant: -5),
			genderLabel.centerYAnchor.constraint(equalTo: genderImageView.centerYAnchor),
			genderLabel.widthAnchor.constraint(equalToConstant: 60),
			genderLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
		])
			
		NSLayoutConstraint.activate([
			ageLabel.rightAnchor.constraint(equalTo: ageImageView.leftAnchor, constant: -5),
			ageLabel.centerYAnchor.constraint(equalTo: ageImageView.centerYAnchor),
			ageLabel.widthAnchor.constraint(equalToConstant: 40),
			ageLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
		])
			
		NSLayoutConstraint.activate([
			emailLabel.leftAnchor.constraint(equalTo: emailImageView.rightAnchor, constant: 5),
			emailLabel.rightAnchor.constraint(equalTo: ageLabel.leftAnchor),
			emailLabel.centerYAnchor.constraint(equalTo: emailImageView.centerYAnchor),
			emailLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
		])
			
		NSLayoutConstraint.activate([
			locationLabel.leftAnchor.constraint(equalTo: locationImageView.rightAnchor, constant: 5),
			locationLabel.rightAnchor.constraint(equalTo: genderLabel.leftAnchor),
			locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
			locationLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
		])
	}
}
