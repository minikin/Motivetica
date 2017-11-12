//
//  HomeViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var motiveticaLogo: UIImageView!
  @IBOutlet weak var manaLabel: UILabel!
  @IBOutlet weak var arrowRight: UIImageView!
  @IBOutlet weak var typeOwnLabel: UILabel!
  @IBOutlet weak var arrowLeft: UIImageView!
  
  // MARK: - Properties
  let apiClient = MotiveticaAPIClient()

  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    apiClient.getAllQuotes { quotes in
      print("MotiveticaAPIClient: \n", quotes)
      for quote in quotes {
        print(quote.author.name)
      }
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    applyThemeToViewController()
  }
  
  // MARK: - Actions
  @IBAction func unwindFromAbout(_ sender: UIStoryboardSegue) {}
  @IBAction func unwindFromListOfQuotes(_ sender: UIStoryboardSegue) {}
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let identifier = segue.identifier else {
      return
    }
    if identifier == "" {
      
    }
  }
  
  // MARK: - Helpers
  private func applyThemeToViewController() {
    backgroundView.backgroundColor = Theme.current.mainColor
    motiveticaLogo.tintColor = Theme.current.globalTintColor
    manaLabel.textColor = Theme.current.globalTintColor
    typeOwnLabel.textColor = Theme.current.globalTintColor
    arrowRight.tintColor = Theme.current.globalTintColor
    arrowLeft.tintColor = Theme.current.globalTintColor
  }
  
}
