//
//  InputCell.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class InputCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.keyboardType = .alphabet
        textField.returnKeyType = .done
        textField.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension InputCell: UITextFieldDelegate {
}
