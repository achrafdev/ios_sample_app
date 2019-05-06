//
//  EmploisViewController.swift
//  abdennadherAchraf
//
//  Created by ESPRIT on 11/28/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class EmploisViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let emploiImg = ["1","2","3","4"]
    
    let emploiNames = ["Strippe","Amazon","Uber","Twitter"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emploiNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Emploi", for: indexPath)
        
        let imageE = cell.viewWithTag(1) as! UIImageView
        let nomE = cell.viewWithTag(2) as! UILabel
        
        
        imageE.image = UIImage(named: emploiImg[indexPath.item])
        nomE.text = emploiNames[indexPath.item]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
