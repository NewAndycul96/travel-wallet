//
//  NewTripNameViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class NewTripNameViewController: UIViewController {

    @IBOutlet weak var nameOfTrip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameOfTrip.delegate = self as? UITextFieldDelegate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveName(_ sender: Any) {
        let nameOfTrips = NameOfTrip(nameOfTrip: nameOfTrip.text ?? "")
        
        do{
            try nameOfTrips?.managedObjectContext?.save()
            
    self.navigationController?.popViewController(animated: true)
        }
        catch{
            print("Could not save name")
        }
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
