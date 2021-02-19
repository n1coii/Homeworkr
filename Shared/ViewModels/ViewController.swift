//
//  ViewController.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-15.
//

import Foundation
import CoreData
import UIKit


class ViewController: UIViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        // The persistent container is available.
    }
}
