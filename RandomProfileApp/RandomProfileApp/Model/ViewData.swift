//
//  UserData.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import Foundation

enum ViewData {
	case initialisation
	case loading(UserData)
	case success(UserData)
	case failure(UserData)
	
	struct UserData {
		let pictureLink: String?
		let gender: String?
		let name: String?
		let country: String?
		let city: String?
		let email: String?
		let phone: String?
		
		init() {
			pictureLink = nil
			gender = nil
			name = nil
			country = nil
			city = nil
			email = nil
			phone = nil
		}
	}
}
