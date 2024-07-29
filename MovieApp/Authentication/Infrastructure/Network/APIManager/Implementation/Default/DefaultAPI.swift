//
//  DefaultAPI.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

class DefaultAPI {
    
    private var urlSession : URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
}

extension DefaultAPI: APIManager {
    
    func initRequest<T>(with data: any Request, type: T.Type, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        
        do {
            
            let urlRequest = try data.createUrlRequest()
                
            self.urlSession.dataTask(with: urlRequest) { data, response, error in
                
                
                // printing data json represetation in the form of logging messages
                print(data?.prettyPrintedJSONString)
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    completion(.failure(NetworkError.invalidServerResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.unknown))
                    return
                }
                
                guard error == nil else {
                    completion(.failure(error ?? NetworkError.unknown))
                    return
                }
                
                
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                }catch {
                    completion(.failure(NetworkError.unknown))
                }
               
            }.resume()
            
        } catch let error {
            completion(.failure(error))
        }
    
    }
    
    
}


extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: jsonObject,
                                                       options: [.prettyPrinted]),
              let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                  return nil
               }

        return prettyJSON
    }
}
