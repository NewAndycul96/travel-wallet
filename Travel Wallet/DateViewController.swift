//
//  StartDateViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var startDate = Date()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func datePickerValueChanged (datePicker: UIDatePicker) {
    
//        let dateformatter = DateFormatter()
//
//        dateformatter.dateStyle = DateFormatter.Style.medium
//
//       // let dateValue = dateformatter.string(from: datePicker.date)
//
//        startDate = datePicker.date
//        print(startDate)
//    }
//
//
    
//    func pickerView(datePicker: UIDatePicker, didSelectRow row: Int, inComponent component: Int) {
//        print(datePicker.date)
//    }
    
    @IBAction func valueDidChange(_ sender: UIDatePicker) {
        print(sender.date)
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let destination = segue.destination as! AddtripViewController
//        destination.startDate =
    
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}

}
