//
//  APIResult.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

typealias JSONDictionary = [ String: Any]

enum APIResult<T> {
  case error(Error)
  case success([T])
  case unexpectedResponse
}
