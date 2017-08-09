//
//  LYRDataAdapter.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation
import VSApiClient

class LYRDataAdapter: LYRDataAdapterProtocol {
    private(set) public var apiClient: VSApiClientProtocol
    
    init() {
        self.apiClient = VSApiClient()
    }
    
    init(apiClient: VSApiClientProtocol) {
        self.apiClient = apiClient
    }
}

extension LYRDataAdapter {
    func fetchData(_ statusUpdate: (LYRDataAdapterResponseStatus) -> Void) {
        
    }
}
