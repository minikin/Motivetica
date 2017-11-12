//
//  MotiveticaAPICRouter.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Alamofire

enum  MotiveticaAPIRouter: URLRequestConvertible {
  
  // MARK: - Base URL
  static let baseURLString = "https://motivetica.com/parse/"
  
  case readAllQuotes(parameters: Parameters)
  case readNewQuotes(date: String, parameters: Parameters)
  
  var path: String {
    switch self {
    case .readAllQuotes, .readNewQuotes:
      return "classes/Quote"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .readAllQuotes, .readNewQuotes:
      return .get
    }
  }
  
  // MARK: - URLRequestConvertible
  
  func asURLRequest() throws -> URLRequest {
    let url = try MotiveticaAPIRouter.baseURLString.asURL()
    var query = Parameters()
    
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue
    urlRequest.timeoutInterval = TimeInterval(10 * 1000)
    
    switch self {
    case .readAllQuotes(let parameters):
      urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
    case .readNewQuotes(let date, let parameters):
      parameters.forEach { query[$0] = $1 }
      query["iso"] = date
      urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    switch self {
    case .readNewQuotes, .readAllQuotes:
      urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    }

    return urlRequest
  }
}
