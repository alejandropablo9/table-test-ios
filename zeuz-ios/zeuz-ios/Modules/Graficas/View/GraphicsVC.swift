//
//  GraphicsVC.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class GraphicsVC: BaseViewController {
    @IBOutlet fileprivate weak var tableView: UITableView!
    var data: [Branches] = []
    var presenter: GraphicsPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.getDataBranches()
        self.navigationItem.title = "Gráficas"
    }
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "PieCharViewCell", bundle: Bundle.main), forCellReuseIdentifier: "pieCharViewCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.allowsMultipleSelection = false
    }
}
extension GraphicsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "pieCharViewCell", for: indexPath) as? PieCharViewCell else {
            return UITableViewCell()
        }
        let element = data[indexPath.row]
        cell.configure(data: element)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
extension GraphicsVC: GraphicsViewProtocol {
    func showDataBranches(data: [Branches]) {
        self.data = data
        tableView.reloadData()
    }
    func requestFailure(message: String) {
        showToast(message: message, style: .failure)
    }
}
