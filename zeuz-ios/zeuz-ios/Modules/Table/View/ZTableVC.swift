//
//  ZTableVC.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class ZTableVC: UIViewController {
    @IBOutlet fileprivate weak var tableView: UITableView!
    private var cells: [ZTableCellEntity] = []
    var presenter: ZTablePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.requestCell()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InputCell", bundle: Bundle.main), forCellReuseIdentifier: "inputCell")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsMultipleSelection = false
    }
}
extension ZTableVC: ZTableViewProtocol {
    func updateCells(cells: [ZTableCellEntity]) {
        self.cells = cells
        self.tableView.reloadData()
    }
}
// MARK: Table Delegate
extension ZTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
