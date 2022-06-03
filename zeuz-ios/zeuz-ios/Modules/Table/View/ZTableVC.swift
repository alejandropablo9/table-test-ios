//
//  ZTableVC.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class ZTableVC: BaseViewController {
    @IBOutlet fileprivate weak var tableView: UITableView!
    private var cells: [ZTableCellEntity] = []
    var presenter: ZTablePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.requestCell()
        self.navigationItem.title = "Tabla"
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InputCell", bundle: Bundle.main), forCellReuseIdentifier: "inputCell")
        tableView.register(UINib(nibName: "TextCell", bundle: Bundle.main), forCellReuseIdentifier: "textCell")
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
        let element = self.cells[indexPath.row]
        switch(element.cellType) {
        case .INPUT:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as? InputCell else {
                return UITableViewCell()
            }
            cell.configure(placeholder: element.title, regex: "[a-zA-ZñÑáÁéÉíÍóÓúÚ ]")
            return cell
        case .PICTURE:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as? TextCell else {
                return UITableViewCell()
            }
            cell.configure(text: element.title)
            return cell
        case .GRAPHICS:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as? TextCell else {
                return UITableViewCell()
            }
            cell.configure(text: element.title)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element = self.cells[indexPath.row]
        switch (element.cellType) {
        case .PICTURE:
            presenter?.showPicture()
            break
        case .GRAPHICS:
            presenter?.showGraphics()
            break
        default: break
        }
    }
}
