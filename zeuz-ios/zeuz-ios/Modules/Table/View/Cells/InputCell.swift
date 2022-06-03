//
//  InputCell.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
final class InputCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    private var regex: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.keyboardType = .alphabet
        textField.returnKeyType = .done
        textField.delegate = self
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension InputCell {
    func configure(placeholder: String, regex: String) {
        textField.placeholder = placeholder
        self.regex = regex
    }
}
extension InputCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let expReg = self.regex, !string.isEmpty {
            return string.matches(expReg)
        }
        return true
    }
}
