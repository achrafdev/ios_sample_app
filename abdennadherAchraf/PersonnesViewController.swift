//
//  PersonnesViewController.swift
//  abdennadherAchraf
//
//  Created by ESPRIT on 11/28/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class PersonnesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let personnesImg = ["p3","p4","p1","p2"]
    
    let personnesNames = ["Jhon Doe","Alan Smith","Angelia Lightcap","Clarinda Pedrick"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Personne")
        let contentView = cell?.viewWithTag(0)
        let persImg = contentView?.viewWithTag(1) as! UIImageView
        let persName = contentView?.viewWithTag(2) as! UILabel
        
        persImg.image = UIImage(named:personnesImg[indexPath.item])
        persName.text = personnesNames[indexPath.item]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? NSIndexPath
        
        if segue.identifier == "toDetails"{
            
            if let destinationViewController =  segue.destination as? DetailsViewController{
                
                destinationViewController.personneNam = personnesNames[index!.item]
                
                destinationViewController.personneImg = personnesImg[index!.item]
                
                destinationViewController.previousPersonne = index!.item
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetails", sender: indexPath)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
