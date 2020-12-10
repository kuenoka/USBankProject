//
//  ViewController.swift
//  USBankProject
//
//  Created by Kingsley Enoka on 12/10/20.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func getImagesBtn(_ sender: UIButton) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(identifier: "ImagesViewController")
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

