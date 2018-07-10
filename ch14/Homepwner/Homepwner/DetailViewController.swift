//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var nameField: BorderTextField!
  @IBOutlet var serialNumberField: BorderTextField!
  @IBOutlet var valueField: BorderTextField!
  @IBOutlet var dateLabel: UILabel!
  
  var item: Item! {
    didSet {
      navigationItem.title = item.name
    }
  }
  
  let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }()
  
  let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
  }()
  
  @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "changeDate":
      let datePickerVC = segue.destination as! DatePickerViewController
      datePickerVC.item = self.item
    default:
      preconditionFailure("Unexpected segue identifier.")
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    nameField.text = item.name
    serialNumberField.text = item.serialNumber
    valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
    dateLabel.text = dateFormatter.string(from: item.dateCreated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    view.endEditing(true)
    
    item.name = nameField.text ?? ""
    item.serialNumber = serialNumberField.text
    if let valueText = valueField.text,
      let value = numberFormatter.number(from: valueText) {
      item.valueInDollars = value.intValue
    } else {
      item.valueInDollars = 0
    }
    if let dateText = dateLabel.text,
      let date = dateFormatter.date(from: dateText) {
      item.dateCreated = date
    }
  }
}

extension DetailViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}


class BorderTextField: UITextField {
  override func becomeFirstResponder() -> Bool {
    super.becomeFirstResponder()
    
    self.borderStyle = .bezel
    return true
  }
  
  override func resignFirstResponder() -> Bool {
    super.resignFirstResponder()
    
    self.borderStyle = .roundedRect
    return true
  }
}
