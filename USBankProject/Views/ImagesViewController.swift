//
//  ImagesViewController.swift
//  USBankProject
//
//  Created by Kingsley Enoka on 12/10/20.
//

import UIKit

class ImagesViewController: UIViewController {
  
  
  @IBOutlet weak var clkView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    clkView.dataSource = self
    clkView.delegate = self
    loadImages(string: "https://jsonplaceholder.typicode.com/photos")
  }
  
  func loadImages(string: String) {
    ImageViewModel.shared.callAPI(string: string) {
      DispatchQueue.main.async {
        self.clkView.reloadData()
      }
    }
  }
  
}

extension ImagesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ImageViewModel.shared.getCount()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
    let imageString = ImageViewModel.shared.getImage(at: indexPath.row).thumbnailUrl
    cell.imgView.downloadImage(string: imageString)
    return cell
  }
  
}

extension UIImageView {
  func downloadImage(string: String) {
    APIHandler.shared.getData(urlString: string) { (data, _, _) in
      guard let data = data else { return }
      let image = UIImage(data: data)
      DispatchQueue.main.async {
        self.image = image
      }
    }
  }
}

extension ImagesViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: collectionView.frame.width/5 , height: collectionView.frame.height/4)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 0.0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 0.0
  }
}

