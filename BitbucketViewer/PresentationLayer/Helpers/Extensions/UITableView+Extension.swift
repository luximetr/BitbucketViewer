//
//  UITableView+Extension.swift
//  BitbucketViewer
//
//  Created by Oleksandr Orlov on 26.06.2021.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(
            withReuseIdentifier reuseIdentifier: String,
            for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }
}

