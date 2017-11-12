//
//  MotiveticaAPIClient.swift
//  Motivetica
//
//  Created by Sasha Minikin on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

class MotiveticaAPIClient {
  
  // MARK: - Properties
  static let sharedInstance = MotiveticaAPIClient()
  
  private var session: URLSession {
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders =  readKeysFrom("MotiveticaKeys")
    return URLSession(configuration: config)
  }
  
  // MARK: -
  
  func getAllQuotes() {
    guard let quotesRequest = MotiveticaAPIRouter.readAllQuotes.urlRequest else {
      return
    }
    _ = session.rx
      .json(request: quotesRequest)
      .observeOn(MainScheduler.instance)
      .subscribe { print($0) }
  }
  
  func getAllAuthors() {
    guard let authorsRequest = MotiveticaAPIRouter.readlAllAuthors.urlRequest else {
      return
    }
    _ = session.rx
      .json(request: authorsRequest)
      .observeOn(MainScheduler.instance)
      .subscribe { print($0) }
  }
}
