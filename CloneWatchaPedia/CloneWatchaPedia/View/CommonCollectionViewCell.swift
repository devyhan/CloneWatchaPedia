//
//  CommonCollectionViewCell.swift
//  CloneWatchaPedia
//
//  Created by 요한 on 2020/12/15.
//

import UIKit

class CommonCollectionViewCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUI() {}
}
