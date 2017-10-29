//
//  TypingMotiveticaViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class TypingMotiveticaViewController: UIViewController {
  
  // MARK: - Properties
  var coreDataStack: CoreDataStack!

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(false)
  
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
      self.performSegue(withIdentifier: "toHomeFormStart", sender: self)
    }
    
  }
  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }

}
