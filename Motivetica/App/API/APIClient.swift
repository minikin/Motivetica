//
//  APIClient.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

typealias JSONDictionary = [ String: Any]

enum APIResult<T> {
  case error(Error)
  case success([T])
  case unexpectedResponse
}

class APIClient {
  
  // MARK: - Properties
  static let sharedInstance = APIClient()
  
  var session: URLSession {
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders =  readKeysFrom("MotiveticaKeys")
    return URLSession(configuration: config)
  }
 
}
