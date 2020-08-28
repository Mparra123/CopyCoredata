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

        var users = [NSManagedObject]()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var lastNametext: UITextField!
    @IBOutlet weak var nameText: UITextField!
   
    override func viewWillAppear(_ animated: Bool) {
        
            super.viewWillAppear(animated)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context =  appDelegate.persistentContainer.viewContext
            
            let request:NSFetchRequest<User> = User.fetchRequest()
            
            do{
                let usersResults = try context.fetch(request)
                users = usersResults
                //print()
            }catch let error {
                print("Error \(error.localizedDescription)")
            }
            
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         //self.tableView.reloadData()
    }
    
    @IBAction func guardar(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
             let context =  appDelegate.persistentContainer.viewContext
             
             let userEntity = NSEntityDescription.entity(forEntityName: "User", in: context)
             let user = NSManagedObject(entity: userEntity!, insertInto: context) as! User
             
             user.name = nameText.text
             user.lastName = lastNametext.text
             user.email = emailText.text
             
             do {
                 try context.save()
                 users.append(user)
                 tableView.reloadData()
             }catch let error {
                 print("Error \(error.localizedDescription)")
             }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
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
