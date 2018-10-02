//
//  DetailViewController.swift
//  Instagram
//
//  Created by Raeleen Watson on 9/30/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    var post: PFObject!
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    var postImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.image = postImage
        self.timestampLabel.text = post["timestamp"] as? String
        self.captionLabel.text = post["caption"] as? String
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
