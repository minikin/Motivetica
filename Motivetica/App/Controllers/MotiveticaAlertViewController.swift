//
//  MotiveticaAlertViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/5/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class MotiveticaAlertViewController: UIViewController {
  // MARK: - Outlets
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var closeButton: UIButton!
  // MARK: - Instance Properties
  private var alertTitle: String?
  private var alertMessage: String?
  private var backgroundColor: UIColor?
  private var textColor: UIColor?
  // MARK: - ViewController: Lifecycle
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    titleLabel.text = alertTitle
    messageLabel.text = alertMessage
    titleLabel.textColor = textColor
    messageLabel.textColor = textColor
    closeButton.tintColor = textColor
    backgroundView.backgroundColor = backgroundColor
  }

  convenience init(title: String, message: String, backgroundColor: UIColor, textColor: UIColor) {
    self.init(nibName: "MotiveticaAlertViewController", bundle: nil)
    self.alertTitle = title
    self.alertMessage = message
    self.textColor = textColor
    self.backgroundColor = backgroundColor
  }
  
  func setData(title: String, message: String, backgroundColor: UIColor, textColor: UIColor) {
    self.alertTitle = title
    self.alertMessage = message
    self.textColor = textColor
    self.backgroundColor = backgroundColor
  }
  // MARK: - Actions
  @IBAction func closeDidPressed(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

}
