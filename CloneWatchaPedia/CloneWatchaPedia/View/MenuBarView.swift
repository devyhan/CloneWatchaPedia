//
//  MenuBarView.swift
//  CloneWatchaPedia
//
//  Created by 요한 on 2020/12/15.
//

import UIKit
import SnapKit

class MenuBar: UIView {
  
  let cellId = "collectionView"
  
  fileprivate lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.dataSource = self
    cv.delegate = self
    cv.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
    cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    return cv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .blue
    
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setUI() {
    self.addSubview(collectionView)
    
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

// MARK: - UICollectionViewDataSource
extension MenuBar: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MenuCell else { fatalError() }
    
    switch indexPath.row {
    case 0:
      cell.titleString = "영화"
    default:
      cell.titleString = "TV 프로그램"
      cell.milestoneToggle = true
    }

    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension MenuBar: UICollectionViewDelegate {
  
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuBar: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    switch indexPath.row {
    case 0:
      return CGSize(width: 40, height: frame.height)
    default:
      return CGSize(width: frame.width / 2, height: frame.height)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

// MARK: - Cell
class MenuCell: CommonCollectionViewCell {
  
  var titleString: String? {
    didSet {
      titleLabel.text = titleString ?? ""
    }
  }
  
  var milestoneToggle: Bool? {
    didSet {
      milestoneLabel.isHidden = milestoneToggle ?? false
    }
  }
  
  fileprivate let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
    
    return label
  }()
  
  fileprivate let milestoneLabel: UILabel = {
    let label = UILabel()
    label.text = "|"
    label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
    
    return label
  }()
  
  override func setUI() {
    super.setUI()
    self.backgroundColor = .cyan
    [titleLabel, milestoneLabel].forEach {
      self.addSubview($0)
    }
    setConstraints()
  }
  
  fileprivate func setConstraints() {
    titleLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    milestoneLabel.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }
}
