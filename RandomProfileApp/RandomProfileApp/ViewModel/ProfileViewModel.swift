//
//  ProfileViewModel.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/12/22.
//

import Foundation

protocol ProfileViewModelProtocol {
	var updateUserData: ((ViewData) -> ())? {get set}
	func fetchUserData()
}

final class ProfileViewModel: ProfileViewModelProtocol {

	var updateUserData: ((ViewData) -> ())?
	
	lazy var sessionConfiguration = _setURLSessionConfiguration()
	lazy var session = URLSession(configuration: sessionConfiguration)
	
	init() {
		updateUserData?(.initialisation)
	}
	
	public func fetchUserData() {
		guard let url = URL(string: api) else {
			updateUserData?(.failure(ViewData.UserData(Data: nil, error: true)))
			print("Can't create url")
			return
		}
		updateUserData?(.loading(ViewData.UserData(Data: nil, error: false)))
		let request = session.dataTask(with: url) { [weak self] (data, response, error) in
			
			guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
				DispatchQueue.main.async { [weak self] in
					self?.updateUserData?(.failure(ViewData.UserData(Data: nil, error: true)))
				}
				print("bad response")
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async { [weak self] in
					self?.updateUserData?(.failure(ViewData.UserData(Data: nil, error: true)))
				}
				print(error.debugDescription)
				return
			}
			
			DispatchQueue.main.async { [weak self] in
				self?.updateUserData?(.success(ViewData.UserData(Data: data, error: false)))
			}
		}
		request.resume()
	}
	
	private func _setURLSessionConfiguration() -> URLSessionConfiguration {
		let configuration = URLSessionConfiguration.default
		configuration.waitsForConnectivity = true
		configuration.timeoutIntervalForResource = 60
		return (configuration)
	}
}
