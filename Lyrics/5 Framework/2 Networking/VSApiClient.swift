//
//  ApiClient.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

private enum HTTPMethod: String {
    case GET
    case POST
}

class VSApiClient {
    private func performRequest(request: URLRequest, _ completion: @escaping (VSApiResponseStatus) -> Void) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                completion(.Failure(error))
            } else if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                completion(.Success(response))
            } else {
                completion(.Failure(nil))
            }
        }).resume()
    }
}

extension VSApiClient: VSApiClientProtocol {
    func get(_ url: String, queryParams: String..., completion: @escaping (VSApiResponseStatus) -> Void) {
        let fullURL = url + "?=" + queryParams.joined(separator: "&")
        guard let url = URL(string: fullURL) else {
            completion(.Failure(nil))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        
        performRequest(request: request, completion)
    }
    
    func post(_ url: String, _ completion: @escaping (VSApiResponseStatus) -> Void) {
        guard let url = URL(string: url) else {
            completion(.Failure(nil))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        completion(.Failure(nil))
    }
    
    func handle(response: URLResponse) {
        
    }
}
