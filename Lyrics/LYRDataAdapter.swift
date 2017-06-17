//
//  LYRDataAdapter.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

class LYRDataAdapter: LYRDataAdapterProtocol {
    private(set) public var apiClient: ApiClientProtocol
    
    public init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
}
