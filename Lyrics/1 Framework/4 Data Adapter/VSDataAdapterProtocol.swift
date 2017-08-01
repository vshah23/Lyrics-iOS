//
//  VSDataAdapterProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

public protocol VSDataAdapterProtocol {
    init(with apiClient: VSApiClientProtocol)
    func fetchData(_ completion: (Any?) -> Void)
}
