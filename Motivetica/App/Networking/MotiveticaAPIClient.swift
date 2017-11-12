//
//  MotiveticaAPIClient.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error {
  case notAuthenticated
  case jsonParsing
  case other
}

class MotiveticaAPIClient {
  
  // MARK: - Properties
  static let sharedInstance = MotiveticaAPIClient()
  private var sessionManager: Alamofire.SessionManager

  // MARK: - Init
  init() {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders =  readKeysFrom("MotiveticaKeys")
    sessionManager = Alamofire.SessionManager(configuration: configuration)
  }
  
  // MARK: -
  
  func getAllQuotes(_ completion: @escaping (QuoteResponse) -> Void) {
    
    let parameters = [
       "include": "author"
    ]
    
    guard let quotesRequest = MotiveticaAPIRouter.readAllQuotes(parameters: parameters).urlRequest else {
      return
    }
    sessionManager.request(quotesRequest)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .responseJSON { json in
        print(json)
      }
      .responseData { dataResponse in
        guard let data = dataResponse.data else { return }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let quoteResponse = try! decoder.decode(QuoteResponse.self, from: data)
        completion(quoteResponse)
    }
  }
}
