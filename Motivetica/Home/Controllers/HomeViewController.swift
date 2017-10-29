//
//  HomeViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire

class HomeViewController: UIViewController {
  
  // MARK: - Properties  
  var session: URLSession {
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders =  readKeysFrom("MotiveticaKeys")
    return URLSession(configuration: config)
  }
  
  let url =  URL(string: "https://motivetica.com/parse/classes/Quote")!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    _ = session.rx
      .json(url: url)
      .observeOn(MainScheduler.instance)
      .subscribe { print($0) }
  }

  @IBAction func unwindFromAbout(_ sender: UIStoryboardSegue) {}
  @IBAction func unwindFromListOfQuotes(_ sender: UIStoryboardSegue) {}
}
