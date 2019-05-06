//
//  DetailsViewController.swift
//  abdennadherAchraf
//
//  Created by ESPRIT on 11/28/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UICollectionViewDataSource {
    
    var personnesImgs = ["p3","p4","p1","p2"]
    
    var personneImg:String?
    
    var personneNam:String?
    
    var previousPersonne:Int?
    
    @IBOutlet weak var personneImage: UIImageView!
    @IBOutlet weak var PersonneName: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pers", for: indexPath)
        
        let image = cell.viewWithTag(1) as! UIImageView
        
        image.image = UIImage(named: personnesImgs[indexPath.item])
        
        return cell
    }
    
    
    
    @IBAction func envoyerMessageClicked(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "vous devez vous connecter avec cette personne pour puvoir lui envoyer un message", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func connecterClicked(_ sender: Any) {
        //Insertion
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let context = persistantContainer.viewContext
        
        //Selecting
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Personne")
        request.predicate = NSPredicate(format: "nom == %@", personneNam!)
        
        do {
            let resultArray = try context.fetch(request)
            
            if resultArray.count == 0 {
                let Personne = NSEntityDescription.entity(forEntityName: "Personne", in: context)
                
                var newPersonne = NSManagedObject(entity: Personne!, insertInto: context)
                
                newPersonne.setValue(personneNam, forKey: "nom")
                newPersonne.setValue(personneImg, forKey: "img")
                
                //Commit insert
                do {
                    try context.save()
                    print("Personne saved successfully..")
                } catch {
                    print("Error commit.. !!")
                }
            } else {
                let alert = UIAlertController(title: "Duplication", message: "Personne already exist", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        } catch {
            print("Error !!")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personneImage.image = UIImage(named: personneImg!)
        
        PersonneName.text = personneNam!
        
        personnesImgs.remove(at: previousPersonne!)
    }
    


}
