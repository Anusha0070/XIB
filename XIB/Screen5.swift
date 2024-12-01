
//
//  Screen5.swift
//  XIB
//
//  Created by Anusha Raju on 11/22/24.
//

import UIKit

class Screen5: UIViewController {
    
    
    @IBOutlet weak var customTableView: UITableView!
    
    var screensList : [String] = [
        "Screen2",
        "Screen3",
        "Screen4",
        "Screen5",
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        customTableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
        customTableView.delegate = self
        
        customTableView.dataSource = self
    }
    
}

extension Screen5: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screensList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        
        cell?.title.text = screensList[indexPath.row]
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let newScreen = storyboard?.instantiateViewController(withIdentifier: "Screen2")
        navigateToScreen2(screen : screensList[indexPath.row])
    }
    
    func navigateToScreen2(screen : String) {
        
        var nextScreen = UIViewController()
        
        if screen == "Screen2" {
            nextScreen = storyboard?.instantiateViewController(withIdentifier: "Screen2") as? Screen2 ?? UIViewController()
        } else if screen == "Screen3" {
            nextScreen = storyboard?.instantiateViewController(withIdentifier: "Screen3") as? Screen3 ?? UIViewController()
        } else if screen == "Screen4" {
            nextScreen = storyboard?.instantiateViewController(withIdentifier: "Screen4") as? Screen4 ?? UIViewController()
        } else if screen == "Screen5" {
            let alert = UIAlertController(title: "This is the last Page!!",
                                          message: "You selected \(screen).",
                                          preferredStyle: .alert)

            // Add an action
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            // Present the alert
            present(alert, animated: true, completion: nil)
        }
        
        navigationController?.pushViewController(nextScreen, animated: true)
        
        nextScreen.title = screen
    
    }
}

