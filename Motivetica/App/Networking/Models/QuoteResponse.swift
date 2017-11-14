//
//  QuoteResponse.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import UIKit

struct QuoteResponse: Codable {
  let id: String
  let quote: String
  let createdAt: String
  let author: AuthorResponse
  
  enum CodingKeys: String, CodingKey {
    case id = "objectId"
    case quote
    case createdAt
    case author
  }
  
  enum AuthorCodingKeys: String, CodingKey {
    case objectId
    case name
  }
}

extension QuoteResponse {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    quote = try container.decode(String.self, forKey: .quote)
    createdAt = try container.decode(String.self, forKey: .createdAt)
    
    let authorContainer = try container.nestedContainer(keyedBy: AuthorCodingKeys.self, forKey: .author)
    let authorId = try authorContainer.decode(String.self, forKey: .objectId)
    let authorName = try authorContainer.decode(String.self, forKey: .name)
    author = AuthorResponse(id: authorId, name: authorName)
  }
}

//extension QuoteResponse: Comparable {
//  var hashValue: Int {
//    return id.djb2hash ^ quote.djb2hash
//  }
//  
//  static func == (lhs: QuoteResponse, rhs: QuoteResponse) -> Bool {
//    return
//      lhs.id == rhs.id &&
//      lhs.quote == rhs.quote
//  }
//}

extension QuoteResponse {
  func configureCell(_ cell: QuotesCell) {
    cell.textView.text = quote
    
    while cell.textView.contentSize.height > cell.textView.frame.size.height {
      cell.textView.font = UIFont(name: "Helvetica Neue", size: CGFloat((cell.textView.font?.pointSize)! - 1))
    }
  }
}

extension QuoteResponse {
  var cellDescriptor: CellDescriptor {
    return CellDescriptor(reuseIdentifier: "QuoteCell", configure: self.configureCell)
  }
}
