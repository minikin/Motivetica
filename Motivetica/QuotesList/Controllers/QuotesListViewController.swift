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
  let calendar = Calendar.current
  let dateFormatter = DateFormatter()
  var timer: Timer?
  
  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setCurrentTime()
    setCurrentDayOfTheWeek()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
      self?.setCurrentTime()
      self?.setCurrentDayOfTheWeek()
    })
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    timer?.invalidate()
    timer = nil
  }
  // MARK: - Actions

  // MARK: - Helpers
  func setCurrentTime() {
    let hour = calendar.component(.hour, from: Date())
    let minutes = calendar.component(.minute, from: Date())
    currentTimeLabel.text = String(format: "%0d:%02d", arguments: [hour, minutes])
  }
  
  func setCurrentDayOfTheWeek() {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    currentDayLabel.text  =  dateFormatter.string(from: Date())
  }
}
