//
//  Screen2.swift
//  XIB
//
//  Created by Anusha Raju on 11/21/24.
//


import UIKit

class Screen2: UIViewController {

    
    @IBOutlet weak var screen2Label: UILabel!
    

    @IBOutlet weak var customTableView2: UITableView!
    var screensList : [String] = [
        "Screen2",
        "Screen3",
        "Screen4",
        "Screen5",
    ]
    
    var receivedScreenData: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        screen2Label.text = receivedScreenData ?? "Not received any data"
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        
        customTableView2.register(nib, forCellReuseIdentifier: "CustomCell")
        
        customTableView2.dataSource = self
        
        customTableView2.delegate = self
        
    }
    
}


extension Screen2: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screensList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        
        cell?.title.text = screensList[indexPath.row]
        
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let x = screensList[indexPath.row]
        
        navigateToScreen2(screen: x)
        
      
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





