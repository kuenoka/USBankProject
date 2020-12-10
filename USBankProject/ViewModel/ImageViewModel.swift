//
//  ImageViewModel.swift
//  USBankProject
//
//  Created by Kingsley Enoka on 12/10/20.
//

import Foundation

class ImageViewModel {
  static let shared = ImageViewModel()
  private var images: [ImageModel] = []
  
  func callAPI(string: String, completion: @escaping ()->()) {
    APIHandler.shared.getData(urlString: string) { (data, response, error) in
      guard let data = data else { return }
      do {
        let model = try JSONDecoder().decode([ImageModel].self, from: data)
        self.images = model
        completion()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func getCount() -> Int {
    return images.count
  }
  
  func getImage(at index: Int) -> ImageModel {
    return images[index]
  }
  
  private init() {}
}
