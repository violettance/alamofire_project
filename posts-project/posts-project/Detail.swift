//
//  Detail.swift
//  posts-project
//
//  Created by İrem Kurt on 30.01.2021.
//

import UIKit

class Detail: UIViewController {
    
    var post: PostsDatum!
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitle?.text = post.title
        txtBody?.text = post.body
        
    }
    

}
