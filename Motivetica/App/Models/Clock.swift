//
//  Clock.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/7/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

struct Clock {
  
  // MARK: - Properties
  private let calendar = Calendar.current
  private let dateFormatter = DateFormatter()
  
  var currentDayOfTheWeek: String {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    return dateFormatter.string(from: Date())
  }
  
  var currentTime: String {
    let hour = calendar.component(.hour, from: Date())
    let minutes = calendar.component(.minute, from: Date())
    return String(format: "%0d:%02d", arguments: [hour, minutes])
  }
}
