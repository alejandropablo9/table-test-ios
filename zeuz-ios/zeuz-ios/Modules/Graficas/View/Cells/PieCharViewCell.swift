//
//  PieCharViewCell.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class PieCharViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var pieChartDetail: ChartDetailView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(data: Branches) {
        self.pieChartDetail.lblTitle.textColor = .black
        self.pieChartDetail.lblTitle.text = data.ask
        var items: [PieChart.Slice] = []
        for item in data.valuesBrach {
            items.append(PieChart.Slice.init(color: .random, value: CGFloat(item.value), text: item.label, valueFormat: "\(item.value)"))
        }
        self.pieChartDetail.items = items
    }
}
