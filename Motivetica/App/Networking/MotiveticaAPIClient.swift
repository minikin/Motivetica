//
//  MotiveticaAPIClient.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

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
  
  // MARK: - Get data from Server
  
  func getAllQuotes(_ completion: @escaping ([QuoteResponse]) -> Void) {
    
    let parameters = [
       "include": "author"
    ]
    
    guard let quotesRequest = MotiveticaAPIRouter.readAllQuotes(parameters: parameters).urlRequest else {
      return
    }
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    sessionManager.request(quotesRequest)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .responseDecodableObject(keyPath: "results", decoder: decoder) { (response: DataResponse<[QuoteResponse]>) in
        completion(response.value!)
    }
  }
  
  func getNewQuotes(_ date: String, completion: @escaping ([QuoteResponse]) -> Void) {
    
    let parameters = [
      "include": "author"
    ]
    
    guard let newQuotesRequest = MotiveticaAPIRouter.readNewQuotes(date: date,
                                                                   parameters: parameters).urlRequest else {
      return
    }
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    sessionManager.request(newQuotesRequest)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .responseDecodableObject(keyPath: "results", decoder: decoder) { (response: DataResponse<[QuoteResponse]>) in
        completion(response.value!)
    }
  }

}
