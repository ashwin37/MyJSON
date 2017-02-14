//
//  ViewController.swift
//  MyJSON
//
//  Created by Ashwin Tallapaka on 2/13/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TBV: UITableView!
    
    var numOfRows = 0
    
    var namesArray = [String]() // An Array
    var ageArray = [String]()   // An Array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TBV.dataSource = self
        TBV.delegate = self
        
        parseJSON()
    }
    
    func parseJSON()
    {
        let path : String = Bundle.main.path(forResource: "Data", ofType: "json")!
        
        let jsonData = NSData(contentsOfFile: path) as NSData!
        
       let readableJSON = JSON(data: jsonData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        let Name = readableJSON["People"] ["Person1"] ["Age"]
        
        numOfRows = readableJSON["People"].count
        
        for i in 1...numOfRows
        {
            var Person = "Person"
            Person += "\(i)"
            let Name = readableJSON["People"][Person]["Name"].string as String!
            let Age = readableJSON["People"][Person]["Age"].string as String!
         
            namesArray.append(Name!)
            ageArray.append(Age!)
            print("\(namesArray)", "\(ageArray)")
            
        }
        print("\(Name)")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return numOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
       if namesArray.count != 0
       {
        cell.textLabel?.text = namesArray[indexPath.row]
       }
        
    return cell
        
    }
   }
