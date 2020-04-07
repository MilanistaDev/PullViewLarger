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
    @IBOutlet weak var tableView: UITableView!

    private let tableHeaderHeight: CGFloat = 200.0
    private let settingsContents: [String] = ["Personal information", "About this App", "Privacy policy", "Feedback", "App version"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }

    private func setUpUI() {
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "Futura-Medium", size: 19)!]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        let profileCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.tableView.register(profileCell, forCellReuseIdentifier: "ProfileCell")
        let contentCell = UINib(nibName: "SettingsTableViewCell", bundle: nil)
        self.tableView.register(contentCell, forCellReuseIdentifier: "SettingsCell")
        self.stretchHeaderView = self.tableView.tableHeaderView
        self.tableView.tableHeaderView = nil
        self.tableView.addSubview(self.stretchHeaderView)
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
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.settingsContents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
            cell.titleLabel.text = self.settingsContents[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateHeaderView()
    }
}
