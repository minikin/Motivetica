//
//  QuotesListViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class QuotesListViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var currentTimeLabel: UILabel!
  @IBOutlet weak var currentDayLabel: UILabel!
  
  // MARK: - Properties
  let currentDate = Date()
  let calendar = Calendar.current
  let dateFormatter = DateFormatter()
  
  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    currentTimeLabel.text = getCurrentTime()
    currentDayLabel.text = getCurrentDayOfTheWeek()
  }
  
  // MARK: - Actions
  // MARK: - Helpers
  func getCurrentTime() -> String {
    let hour = calendar.component(.hour, from: currentDate)
    let minutes = calendar.component(.minute, from: currentDate)
    let seconds = calendar.component(.second, from: currentDate)
    return ("\(hour):\(minutes):\(seconds)")
  }
  
  func getCurrentDayOfTheWeek() -> String {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    return dateFormatter.string(from: currentDate)
  }
}
