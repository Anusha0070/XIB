//
//  ViewController.swift
//  XIB
//
//  Created by Anusha Raju on 11/21/24.
//

import UIKit

class ViewController: UIViewController {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        
//        return cell
//    }
//    

    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
//            let nib = UINib(nibName: "CustomCell", bundle: nil)
//        customTableView.register(nib, forCellReuseIdentifier: "CustomCell")
//            
//        customTableView.delegate = self
//        customTableView.dataSource = self
    }


}


