//
//  RestaurantViewController.swift
//  Mockup
//
//  Created by Yunpeng Niu on 09/03/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var restaurantListing: UICollectionView!

    let food = [#imageLiteral(resourceName: "cake"), #imageLiteral(resourceName: "fruit"), #imageLiteral(resourceName: "pasta"), #imageLiteral(resourceName: "pizza"), #imageLiteral(resourceName: "salmon")]
    let name = ["Swift Canteen", "Blast Saga Food Center", "AMK Hawker Center", "My pizza", "Vista Cut"]
    let location = ["<100m", "<500m", "10km", "30km", "5km"]
    let waitingTime = ["15min", "7min", "10min", "30min", "<1min"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(UIColor.blue, for: .normal)
        }
        restaurantListing.delegate = self
        restaurantListing.dataSource = self
        searchBar.delegate = self
    }
}

extension RestaurantViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    /// Sets the number of sections.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return food.count
    }

    /// Sets the number cells per row.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    /// Data source for each cell.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = getReusableBubbleCell(for: indexPath)
        cell.image.image = food[indexPath.section]
        cell.name.text = name[indexPath.section]
        cell.location.text = location[indexPath.section]
        cell.waitingTime.text = waitingTime[indexPath.section]
        return cell
    }

    /// Gets a reusable cell for preparing a new cell.
    private func getReusableBubbleCell(for indexPath: IndexPath) -> RestaurantCell {
        guard let cell = restaurantListing.dequeueReusableCell(withReuseIdentifier: "restaurantCell",
                                                               for: indexPath) as? RestaurantCell else {
            fatalError("Unable to dequeue a reusable cell.")
        }
        return cell
    }
}

extension RestaurantViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        restaurantListing.alpha = 0.4
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        restaurantListing.alpha = 1
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        restaurantListing.alpha = 1
    }
}
