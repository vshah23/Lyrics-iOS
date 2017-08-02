//
//  VSDataAdapter.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

private let googleURL = "http://www.google.com"

public class VSDataAdapter: VSDataAdapterProtocol {
    private(set) public var apiClient: VSApiClientProtocol
    
    public required init(with apiClient: VSApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    public init() {
        self.apiClient = VSApiClient()
    }
    
    public func fetchData(_ completion: @escaping (Any?) -> Void) {
        apiClient.get(googleURL, queryParams: nil, completion: completion)
    }
}
