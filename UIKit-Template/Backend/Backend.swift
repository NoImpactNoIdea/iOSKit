//
//  Backend.swift
//  UIKit-Template
//
//  Created by Steven Wright (Cryptobyte) on 4/19/24.
//

import Foundation

class Backend {
    
    // base, endpoint, bearer
    let BASE_URL = "", url = "", ACCESS_TOKEN = ""
    
    internal func fetch<T: Codable>(url: String, parameters: [String: String]? = nil) async throws -> T {
        guard var curl = URLComponents(string: "\(BASE_URL)\(url)") else {
            fatalError("Invalid URL")
        }
        
        if (parameters != nil) {
            var query: [URLQueryItem] = []
            
            parameters?.forEach({ (key: String, value: String) in
                query.append(URLQueryItem(name: key, value: value))
            })
            
            curl.queryItems = query
        }
        
        guard let durl = curl.url else {
            fatalError("Invalid URL")
        }
        
        var req = URLRequest(url: durl)
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults().string(forKey: ACCESS_TOKEN) {
            req.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        }

        let (data, _) = try await URLSession.shared.data(for: req)
        
        let decoded = try JSONDecoder().decode(T.self, from: data)
        
        return decoded
    }
   
    
    internal func put<T: Codable, B: Codable>(url: String, body: B) async throws -> T {
        guard let durl = URL(string: "\(BASE_URL)\(url)") else {
            fatalError("Invalid URL")
        }
        
        let httpBody = try! JSONEncoder().encode(body)
        
        var req = URLRequest(url: durl)
        req.httpMethod = "PUT"
        req.httpBody = httpBody
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults().string(forKey: ACCESS_TOKEN) {
            req.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, _) = try await URLSession.shared.data(for: req)
        
        let decoded = try JSONDecoder().decode(T.self, from: data)
        
        return decoded
    }
   
    internal func post<T: Codable, B: Codable>(url: String, body: B) async throws -> T {
        guard let durl = URL(string: "\(BASE_URL)\(url)") else {
            fatalError("Invalid URL")
        }
        
        let httpBody = try! JSONEncoder().encode(body)
        
        var req = URLRequest(url: durl)
        req.httpMethod = "POST"
        req.httpBody = httpBody
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults().string(forKey: ACCESS_TOKEN) {
            req.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, _) = try await URLSession.shared.data(for: req)
        
        // Attempt to convert the data to a String
        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Unable to convert data to a string.")
        }
        
        let decoded = try JSONDecoder().decode(T.self, from: data)

        return decoded
    }
    
    internal func patch<T: Codable, B: Codable>(url: String, body: B) async throws -> T {
        guard let durl = URL(string: "\(BASE_URL)\(url)") else {
            fatalError("Invalid URL")
        }
        
        let httpBody = try! JSONEncoder().encode(body)
        
        var req = URLRequest(url: durl)
        req.httpMethod = "PATCH"
        req.httpBody = httpBody
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults().string(forKey: ACCESS_TOKEN) {
            req.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, _) = try await URLSession.shared.data(for: req)
        
        let decoded = try JSONDecoder().decode(T.self, from: data)

        return decoded
    }
    
    internal func delete<T: Codable, B: Codable>(url: String, body: B) async throws -> T {
        guard let durl = URL(string: "\(BASE_URL)\(url)") else {
            fatalError("Invalid URL")
        }
        
        var req = URLRequest(url: durl)
        req.httpMethod = "DELETE"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults().string(forKey: ACCESS_TOKEN) {
            req.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, _) = try await URLSession.shared.data(for: req)
        
        let decoded = try JSONDecoder().decode(T.self, from: data)

        return decoded
    }
}
