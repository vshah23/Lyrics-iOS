//
//  ApiClientProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

enum ApiResponseStatus {
    case Success(HTTPURLResponse)
    case Failure(Error?)
}

protocol ApiClientProtocol {
    func get(_ url: String, queryParams: String..., completion: @escaping (ApiResponseStatus) -> Void)
    func post(_ url: String, _ completion: @escaping (ApiResponseStatus) -> Void)
}
