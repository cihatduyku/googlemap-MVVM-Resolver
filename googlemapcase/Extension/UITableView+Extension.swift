//
//  UITableView+Extension.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 25.09.2022.
//

import UIKit

extension UITableView {
    
    func register(typeOfnib: UITableViewCell.Type) {
        let id = String(describing: typeOfnib)
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forCellReuseIdentifier: id)
    }

    func dequeue<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
}
