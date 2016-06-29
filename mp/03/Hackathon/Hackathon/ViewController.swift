//
//  ViewController.swift
//  Hackathon
//
//  Created by Sami Ahmad Khan on 6/28/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var dbPath: String!
    var db: COpaquePointer!
    var todoItems = [(Int, String)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true) as [NSString]
        dbPath = dirs[0].stringByAppendingPathComponent("CameraViolations.db")
        print(dbPath)
        db = openDatabase()

        //query()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Open Database
    func openDatabase() -> COpaquePointer {
        var db: COpaquePointer = nil
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Database opened")
            return db
        } else {
            print("Database Not Found !")
            return nil
        }
    }
    
    let queryStatementString = "SELECT * FROM CameraViolations;"
    
    func query() {
        var queryStatement: COpaquePointer = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            todoItems = []
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                let text = String.fromCString(UnsafePointer<CChar>(queryResultCol1))!
                todoItems.append((Int(id), text))
                print("\(id) | \(text)")
            }
        }
        sqlite3_finalize(queryStatement)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        return cell
    }

    
    

}

