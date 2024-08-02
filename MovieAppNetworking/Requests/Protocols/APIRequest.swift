//
//  Request.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

public protocol APIRequest {
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var httpBody : Codable? { get }
    var urlParams: [String: String?] { get }
}

// MARK: - Default RequestProtocol
public extension APIRequest {
    var host: String {
        APIConstants.host
    }
    
    var httpBody: Codable? {
        return nil
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    func createUrlRequest() throws -> URLRequest {
         
        guard let url = createURLComponents().url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.setValue("Bearer \(APIConstants.apiAccessToken)", forHTTPHeaderField: "Authorization")
        
        if let httpBody = httpBody {
            urlRequest.httpBody = try JSONEncoder().encode(httpBody)
        }
        
        return urlRequest
    }
    
    private func createURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        
        return components
    }
    
    
}
