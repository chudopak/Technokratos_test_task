//
//  ProfileViewModel.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import Foundation

protocol ProfileViewModelProtocol {
	var updateUserData: ((ViewData) -> ())? {get set}
	func startFetch()
}

final class ProfileViewModel: ProfileViewModelProtocol {
	var updateUserData: ((ViewData) -> ())?
	
	init() {
		updateUserData?(.initialisation)
	}
	
	public func startFetch() {
		updateUserData?(.loading(ViewData.UserData()))
	}
}
