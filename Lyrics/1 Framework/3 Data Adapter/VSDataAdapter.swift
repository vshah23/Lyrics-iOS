//
//  VSDataAdapter.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation
import VSApiClient

enum VSDataAdapterResponseStatus {
    case Loading
    case Success(Any?)
    case NetworkUnavailable
    case SomethingWentWrong
}

private let googleURL = "http://www.google.com"

class VSDataAdapter {
    private(set) var apiClient: VSApiClientProtocol
    
    init() {
        self.apiClient = VSApiClient()
    }
    
    required init(with apiClient: VSApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchData(_ completion: @escaping (VSDataAdapterResponseStatus) -> Void) {
        weak var weakSelf = self
        completion(.Loading)
        apiClient.get(googleURL, queryParams: nil) { status in
            switch status {
            case .Success(let response):
                completion(.Success(response))
            case .Failure(let error):
                weakSelf?.handleFailure(error: error, completion)
            }
        }
    }
    
    private func handleFailure(error: Error?, _ completion: @escaping (VSDataAdapterResponseStatus) -> Void) {
        guard let error = error else {
            completion(.SomethingWentWrong)
            return
        }
        
        print(error.localizedDescription)
        
        //TODO: check the error to make sure to only do this when true
        completion(.NetworkUnavailable)
    }
}
