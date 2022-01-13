//
//  UserData.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import Foundation
import UIKit

enum ViewData {
	case initialisation
	case loading(UserData)
	case success(UserData)
	case failure(UserData)
	
	struct UserData {
		var pictureLink: String?
		var gender: String?
		var name: String?
		var location: String?
		var email: String?
		var age: String?
		
		init(Data: Data?, error: Bool) {

			if let data = Data {
				let result = _getResultDictionary(data: data)
				if (result != nil) {
					_setProperties(results: result!)
				} else {
					_setPropertiesErrorCase()
				}
			} else {
				pictureLink = nil
				gender = nil
				name = nil
				location = nil
				email = nil
				age = nil
			}
		}
		
		private mutating func _getResultDictionary(data: Data) -> [String: Any]? {

			var jsonData: [String: Any]?
			do {
				jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
			} catch {
				print("JSON ERROR \(error)")
				return (nil)
			}
			guard let jsonUnwrapedData = jsonData else {
				return (nil)
			}
			
			guard let resultArray = jsonUnwrapedData["results"] as? [Any] else {
				print("Can not get result array")
				return (nil)
			}
			
			guard let resultDictionary = resultArray[0] as? [String: Any] else {
				print("Can not get result dictionary")
				return (nil)
			}
			return (resultDictionary)
		}
		
		private mutating func _setProperties(results: [String: Any]) {

			_getEmail(results: results)
			_getLocation(results: results)
			_getAge(results: results)
			_getName(results: results)
			_getGender(results: results)
			_getPictureLink(results: results)
		}
		
		private mutating func _setPropertiesErrorCase() {

			pictureLink = nil
			gender = "Error"
			name = "Error"
			location = "Error"
			email = "Error"
			age = "Error"
		}
		
		private mutating func _getEmail(results: [String: Any]) {
			if let email = results["email"] as? String {
				self.email = email
			} else {
				self.email = "No email providet"
			}
		}
		
		private mutating func _getLocation(results: [String: Any]) {
			if let location = results["location"] as? [String: Any] {
				self.location = ""
				if let city = location["city"] as? String {
					self.location! += city
				}
				if let country = location["country"] as? String {
					if (self.location! != "") {
						self.location! += ", \(country)"
					} else {
						self.location! += country
					}
				}
				if (self.location! == "") {
					self.location = "No location providet"
				}
			} else {
				self.location = "No location providet"
			}
		}
		
		private mutating func _getAge(results: [String: Any]) {
			if let dob = results["dob"] as? [String: Any] {
				if let age = dob["age"] as? Int {
					self.age = String(age)
				} else {
					self.age = "No age providet"
				}
			} else {
				self.age = "No age providet"
			}
		}
		
		private mutating func _getName(results: [String: Any]) {
			if let name = results["name"] as? [String: Any] {
				self.name = ""
				if let first = name["first"] as? String {
					self.name = first
				}
				if let last = name["last"] as? String {
					if (self.name! != "") {
						self.name! += " \(last)"
					} else {
						self.name = last
					}
				}
				if (self.name! == "") {
					self.name = "No name providet"
				}
			} else {
				self.name = "No name providet"
			}
		}
		
		private mutating func _getGender(results: [String: Any]) {
			if let gender = results["gender"] as? String {
				self.gender = gender
			} else {
				self.gender = "MultiGender"
			}
		}
		
		private mutating func _getPictureLink(results: [String: Any]) {
			if let picture = results["picture"] as? [String: Any] {
				if let link = picture["large"] as? String {
					self.pictureLink = link
				} else {
					self.pictureLink = nil
				}
			} else {
				self.pictureLink = nil
			}
		}
	}
}
