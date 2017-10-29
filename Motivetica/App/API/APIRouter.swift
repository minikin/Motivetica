//
//  APIRouter.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
  
  // MARK: - Base URL
  static let baseURL = "https://motivetica.com/parse/"
  
  case readAuthor(withId: String)
  case readlAllAuthors
  case readQuote(withId: String)
  case readAllQuotes
  case readNewQuotes
  
  var path: String {
    switch self {
    case .readAuthor(let id):
      return "/classes/Author\(id)"
    case .readlAllAuthors:
      return "/classes/Author"
    case .readQuote(let id):
      return "/classes/Quote\(id)"
    case .readAllQuotes:
      return "/classes/Quote"
    case .readNewQuotes:
      return "/classes/Quote"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .readAuthor, .readlAllAuthors, .readQuote, .readAllQuotes, .readNewQuotes:
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = try APIRouter.baseURL.asURL()
    
    var request = URLRequest(url: url.appendingPathComponent(self.path))
    request.httpMethod = self.method.rawValue
    request.timeoutInterval = TimeInterval(10 * 1000)
    return request
  }
}