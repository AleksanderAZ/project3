//
//  ApiServise.swift
//  LoginScreen
//
//  Created by Oleksander on 25.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//

import Foundation

class ApiServise: NSObject {
    
    static let shared = ApiServise()
    private var sessionDataTask: URLSessionDataTask?
    
    private override init() {
        super.init()
    }
    
    internal func request<T: Codable>(_ method: String,_ url: String,_ parameters: [String: String], completion: @escaping (T?, _ error: String?)->()) {
        guard var components = URLComponents(string: url) else { return completion(nil, "error: URLComponents") }
        components.addQueryItems(parameters)
        guard let componentsUrl = components.url else { return completion(nil, "error:  url") }
        var request = URLRequest(url: componentsUrl)
        request.httpMethod = method
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode, error == nil else {
                completion(nil, error?.localizedDescription)
                print("ERROR ERROOR")
                return
            }
            do {
                let result = try JSONDecoder().decode(T?.self, from: data)
                completion(result, nil)
            } catch {
                print("ERROR", error.localizedDescription)
                completion(nil, "error load data")
            }
        }
        self.sessionDataTask = task
        task.resume()
    }
    
    func cancelRequests() {
        sessionDataTask?.cancel()
    }
    
    func loadAPIRequest<T: Codable>(url: String, completion: @escaping (T?, String?)->()) {
        let parameters = [String: String]()
        
        self.request("GET", url, parameters) { [weak self] (result: T?, error) in
            guard let result = result else {
                completion(nil, error)
                return
            }
            completion(result, nil)
        }
    }
}

extension URLComponents {
    mutating func addQueryItems(_ parameters: [String: String]) {
        self.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        self.percentEncodedQuery = self.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    }
}
