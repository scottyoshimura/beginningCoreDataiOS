//
//  ViewController.swift
//  coreDataDemo
//
//  Created by Scott Yoshimura on 5/19/15.
//  Copyright (c) 2015 west coast dev. All rights reserved.
//  when working with coreData, the database is permanent storage. unlike NSUserDefaults
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lets set up some setup code to access core data. this sets up the context for us to work with hte db.
        
        //we are setting up a an AppDelegate to deal with core data.
        var appDelegate0:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //now we can refer to the app delegate
        
        var context:NSManagedObjectContext = appDelegate0.managedObjectContext!
        //this context gives us a framework within which we can access our database that we force unwrap
        
        //lets add something new into the database
        
  //      var newUser = NSEntityDescription.insertNewObjectForEntityForName("TblUsers", inManagedObjectContext: context) as! NSManagedObject
        //entityNames are the table names. the aboev is saying, insert a New Object into the enttity named TblUsers, using contetxt
            //we will downcast it as a NSManagedObject so that we can work with the newUser variable and put it into the table.
        
        //lets add some data to the table
  //      newUser.setValue("Steve", forKey: "userName")
  //      newUser.setValue("pass4", forKey: "userPassword")
        
  //      context.save(nil) // we use nil for now. we should set up an error
        
  
        
        //now lets set up a request from the database to fetch data
        var request = NSFetchRequest(entityName: "TblUsers")
        request.returnsObjectsAsFaults = false //this line may be an x-code issue.
        
        //lets setup a predicate so that we can query for information based on some critera. the first initial string is the name of the key that we are searching in, in this case it is userName. the %@ is the place holder for the arguement. in this case the argument is "Steve"
        request.predicate = NSPredicate(format: "userName = %@", "Steve")
        //*note we could add multiple predicates to check with certain userNames and userPasswords, like a login function
        
        //lets create a results array that will store the data from the request
        var tableResults = context.executeFetchRequest(request, error: nil)
        
        //var errorMessage:NSError? = nil
        
        //lets loop through the results array and extract the data
        //lets set up the if check before we run the loop
        if tableResults?.count > 0 {
            println(tableResults?.count)
            println(tableResults)
            //nowlets set up the for loop
            for resultOutcome:AnyObject in tableResults! {
                
                //the below chunk of code doesn't work in the latest version of Xcode
                /*below is a useful way to use the optional value, only if it has a value. note the difference between result.password and below with the exclamation point.
                if let pass = result.password!{
                    //if result.password does have a value, then pass will be given that value, there for pass therefor is not an optional. it is a proper variable that we are sure has a value
                    println(pass)
                    //we are forcing the result.password using an exclamation.
                }*/
                
        /*
                //below is a way to delete an object from an entity
                if let user = resultOutcome.valueForKey("userName") as? String{
                    //println(user)
                    if user == "Steve" {
                        //if Rose is is the user, we can delete that object by referring back to the context.deleteObject method with NSManagedObject as a variable type
                            //because NSManaged is not NSAnyObject, so we need to recast it
                        context.deleteObject(resultOutcome as! NSManagedObject)
                        println(user + " has been deleted")
                
                        }
                    }
                //and lets save the context after running this if let
                context.save(nil)
        */
        
                
        
                //below is a way to search for an object
         /*       if let user = resultOutcome.valueForKey("userName") as? String{
                    
                    if user == "Steve" {
                        println(user + " has been found")
                        
                    }
                }

        */
                
                
         /*       //below is a way for the user to change their userPassword. in used with conjunction of the predicate search
                if let user = resultOutcome.valueForKey("userName") as? String{
                
                    if user == "Steve" {
                    //println(user + " has been found")
                        resultOutcome.setValue("pass02", forKey: "userPassword")
                    }
                }
                context.save(nil)
         */
            }

        } else {
            println("no results")
        }

 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

