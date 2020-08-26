//
//  ViewController.swift
//  CopyCoredata
//
//  Created by Mauricio Parrales on 8/25/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func guardar(_ sender: Any) {
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var lastNametext: UITextField!
    @IBOutlet weak var nameText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row] as? User
        cell.textLabel?.text = "\(user?.name ?? "") \(user?.lastName ?? "")"
        return cell
    }
    

}

