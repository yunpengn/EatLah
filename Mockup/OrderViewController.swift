//
//  OrderViewController.swift
//  Mockup
//
//  Created by Yunpeng Niu on 10/03/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var orderListing: UICollectionView!

    let images = [#imageLiteral(resourceName: "chickenRice"), #imageLiteral(resourceName: "curryMonster"), #imageLiteral(resourceName: "burger")]
    let restaurants = ["Biz Canteen Chick Rice", "Vivocity Curry Monster", "Burger King"]
    let time = ["04-08-2018 15:31", "04-08-2018 14:27", "22-05-2018 20:47"]
    let status: [Status] = [.preparing, .ready, .finish]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderListing.delegate = self
        orderListing.dataSource = self
    }
}

extension OrderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /// Sets the number of sections.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return images.count
    }

    /// Sets the number cells per row.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    /// Data source for each cell.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = getReusableBubbleCell(for: indexPath)
        cell.image.image = images[indexPath.section]
        cell.restaurant.text = restaurants[indexPath.section]
        cell.createTime.text = time[indexPath.section]
        cell.status.setText(status[indexPath.section])
        return cell
    }

    /// Gets a reusable cell for preparing a new cell.
    private func getReusableBubbleCell(for indexPath: IndexPath) -> OrderCell {
        guard let cell = orderListing.dequeueReusableCell(withReuseIdentifier: "orderCell",
                                                          for: indexPath) as? OrderCell else {
            fatalError("Unable to dequeue a reusable cell.")
        }
        return cell
    }
}
