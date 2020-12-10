//
//  ImageModel.swift
//  USBankProject
//
//  Created by Kingsley Enoka on 12/10/20.
//

import Foundation

struct ImageModel: Decodable {
  var albumId: Int
  var id: Int
  var title: String
  var url: String
  var thumbnailUrl: String
}
