//
//  RowViewCell.swift
//  Components
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
class RowViewCell: UITableViewCell {
    /// Variable para la vista que representa un indicador de color.
    @IBOutlet weak var viewBulletPoint: UIView!
    /// Variable para almacenar el parametro name.
    @IBOutlet weak var lblName: UILabel!
    /// Variable para almacenar el parametro detail.
    @IBOutlet weak var lblDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUpView() {
        self.viewBulletPoint.layer.cornerRadius = self.viewBulletPoint.frame.size.width/2
        self.viewBulletPoint.clipsToBounds = true
    }
}
