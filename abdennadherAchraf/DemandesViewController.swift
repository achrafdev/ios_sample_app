//
//  DemandesViewController.swift
//  abdennadherAchraf
//
//  Created by ESPRIT on 11/28/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class DemandesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personnesArray: [NSManagedObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Personne") as! UITableViewCell
        let content = cell.viewWithTag(0)
        let personneImg = content!.viewWithTag(1) as! UIImageView
        let personneLabel = content!.viewWithTag(2) as! UILabel
        
        let personne = personnesArray[indexPath.row]
        personneImg.image = UIImage(named: personne.value(forKey: "img") as! String)
        personneLabel.text = personne.value(forKey: "nom") as! String
        
        return cell
    }
    
    func fetchPersonnes() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistanceContainer = appDelegate.persistentContainer
        let context = persistanceContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Personne")
        
        do {
            personnesArray = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let personneToDelete = personnesArray[indexPath.row]
            
            context.delete(personneToDelete)
            do {
                try context.save()
                personnesArray.remove(at: indexPath.row)
                //tv.reloadData()
            } catch {
                print("Error.. !")
            }
            
            
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchPersonnes()
    }
    


}
