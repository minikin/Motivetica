//
//  AuthorResponse.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

typealias Comparable = Hashable & Equatable

struct AuthorResponse: Codable {
  let id: String
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case id = "objectId"
    case name
  }
}

extension AuthorResponse {
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      id = try container.decode(String.self, forKey: .id)
      name = try container.decode(String.self, forKey: .name)
    }
}

extension AuthorResponse: Comparable {
  var hashValue: Int {
    return id.djb2hash ^ name.djb2hash
  }
  
  static func == (lhs: AuthorResponse, rhs: AuthorResponse) -> Bool {
    return
      lhs.id == rhs.id &&
      lhs.name == rhs.name
  }
}
