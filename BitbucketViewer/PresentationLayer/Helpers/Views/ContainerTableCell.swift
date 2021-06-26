//
//  ContainerTableCell.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

class ContainerTableCell<V>: UITableViewCell where V: UIView {
  
  // MARK: - UI elements
  
  let view = V()
  
  // MARK: - Life cycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    autoLayout()
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - AutoLayout
  
  private func autoLayout() {
    contentView.addSubview(view)
    view.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
