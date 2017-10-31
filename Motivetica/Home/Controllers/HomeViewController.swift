//
//  HomeViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  let apiClient = APIClient()

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    apiClient.getAllQuotes()
  }

  // MARK: - Actions
  @IBAction func unwindFromAbout(_ sender: UIStoryboardSegue) {}
  @IBAction func unwindFromListOfQuotes(_ sender: UIStoryboardSegue) {}
}
