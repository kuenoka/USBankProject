//
//  APIHandler.swift
//  USBankProject
//
//  Created by Kingsley Enoka on 12/10/20.
//

import Foundation

class APIHandler {
  
  static let shared = APIHandler()
  
  func getData(urlString: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      completionHandler(data, response, error)
    }.resume()
  }
  
  private init() {}
}
