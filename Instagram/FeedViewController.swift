//
//  FeedViewController.swift
//  Instagram
//
//  Created by Raeleen Watson on 9/30/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: ViewController {

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            if let error = error {
                print("User logout failed: \(error.localizedDescription)")
            } else {
                print("User logout successful")
                //need to segue back to login screen
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            }
        }
        //NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
       // self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
