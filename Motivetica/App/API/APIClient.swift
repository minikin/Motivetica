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
  
  private var session: URLSession {
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders =  readKeysFrom("MotiveticaKeys")
    return URLSession(configuration: config)
  }
  
  // MARK: - 
  
  func getAllQuotes() {
    guard let quotesRequest = APIRouter.readAllQuotes.urlRequest else {
      return
    }
    _ = session.rx
      .json(request: quotesRequest)
      .observeOn(MainScheduler.instance)
      .subscribe { print($0) }
  }
  
  func getAllAuthors() {
    guard let authorsRequest = APIRouter.readlAllAuthors.urlRequest else {
      return
    }
    _ = session.rx
      .json(request: authorsRequest)
      .observeOn(MainScheduler.instance)
      .subscribe { print($0) }
  }
}
