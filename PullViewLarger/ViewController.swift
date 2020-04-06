//
//  ViewController.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/06.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.tableView.bringSubviewToFront(self.profileView)
    }

    private func setUpUI() {
        self.tableView.bringSubviewToFront(self.profileView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
        self.profileImageView.layer.borderWidth = 2.0
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
