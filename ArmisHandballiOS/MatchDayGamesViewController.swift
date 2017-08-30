//
//  MatchDayGamesViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 30/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit
class MatchDayGamesViewController: UITableViewController {

 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationHeight = topLayoutGuide.length
        tableView.contentInset.top = navigationHeight + TabPageOption().tabHeight
    }
    
    fileprivate func updateNavigationBarOrigin(velocity: CGPoint) {
        guard let tabPageViewController = parent as? TabPageViewController else { return }
        
        if velocity.y > 0.5 {
            tabPageViewController.updateNavigationBarHidden(true, animated: true)
        } else if velocity.y < -0.5 {
            tabPageViewController.updateNavigationBarHidden(false, animated: true)
        }
    }
}


// MARK: - UITableViewDataSource

extension MatchDayGamesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String((indexPath as NSIndexPath).row)
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension MatchDayGamesViewController {
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        updateNavigationBarOrigin(velocity: velocity)
    }
    
    override func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        guard let tabpageViewController = parent as? TabPageViewController else { return }
        
        tabpageViewController.showNavigationBar()
    }


}
