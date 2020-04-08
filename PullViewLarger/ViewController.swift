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
    @IBOutlet weak var profileBaseView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    private let tableHeaderHeight: CGFloat = 200.0
    private let tableFooterHeight: CGFloat = 16.0
    private let settingsContents: [[String]] = [["Personal information"], ["About this App", "Privacy policy", "Feedback"], ["App version"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }

    private func setUpUI() {
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Futura-Medium", size: 19.0)!]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        let profileCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.tableView.register(profileCell, forCellReuseIdentifier: "ProfileCell")
        let contentCell = UINib(nibName: "SettingsTableViewCell", bundle: nil)
        self.tableView.register(contentCell, forCellReuseIdentifier: "SettingsCell")
        let appVerCell = UINib(nibName: "AppVersionTableViewCell", bundle: nil)
        self.tableView.register(appVerCell, forCellReuseIdentifier: "AppVerCell")
        self.stretchHeaderView = self.tableView.tableHeaderView
        self.tableView.tableHeaderView = nil
        self.tableView.addSubview(self.stretchHeaderView)
        self.tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentOffset = CGPoint(x: 0.0, y: -tableHeaderHeight)
        self.profileBaseView.layer.cornerRadius = self.profileBaseView.frame.width / 2
        self.profileBaseView.layer.borderColor = UIColor.white.cgColor
        self.profileBaseView.layer.borderWidth = 2.0
        self.profileBaseView.layer.shadowColor = UIColor.black.cgColor
        self.profileBaseView.layer.shadowOpacity = 0.5
        self.profileBaseView.layer.shadowOffset = .zero
        self.profileBaseView.layer.shadowRadius = 5.0
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileBaseView.frame.width / 2
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

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.settingsContents.count + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.settingsContents[section - 1].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppVerCell", for: indexPath) as! AppVersionTableViewCell
            cell.titleLabel.text = self.settingsContents[indexPath.section - 1][indexPath.row]
            let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            cell.detailTitleLabel.text = version
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
            cell.titleLabel.text = self.settingsContents[indexPath.section - 1][indexPath.row]
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: self.tableView.frame.width,
                                              height: tableFooterHeight))
        footerView.backgroundColor = .systemGroupedBackground
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 1, 2:
            return tableFooterHeight
        default:
            return 0.0
        }
    }
}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateHeaderView()
    }
}
