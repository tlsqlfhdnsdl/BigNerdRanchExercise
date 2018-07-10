//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by USER on 2018. 7. 10..
//  Copyright © 2018년 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
  
  var item: Item!
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBAction func doneChangeDate(_ sender: UIBarButtonItem) {
    item.dateCreated = datePicker.date
    self.navigationController?.popViewController(animated: true)
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
