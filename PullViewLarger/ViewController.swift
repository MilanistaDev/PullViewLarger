//
//  ViewController.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/06.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var stretchHeaderView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!

    private let tableHeaderHeight: CGFloat = 200.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }

    private func setUpUI() {
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "Futura-Medium", size: 21)!]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
        self.profileImageView.layer.borderWidth = 2.0
        self.stretchHeaderView = self.tableView.tableHeaderView
        self.tableView.tableHeaderView = nil
        self.tableView.addSubview(self.stretchHeaderView)
        self.tableView.bringSubviewToFront(self.profileView)
        self.tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentOffset = CGPoint(x: 0.0, y: -tableHeaderHeight)
        self.updateHeaderView()
    }

    private func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: self.tableView.frame.size.width, height: tableHeaderHeight)
        if self.tableView.contentOffset.y < -tableHeaderHeight {
            headerRect.origin.y = self.tableView.contentOffset.y
            headerRect.size.height = -self.tableView.contentOffset.y
        }
        self.stretchHeaderView.frame = headerRect
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateHeaderView()
    }
}
