//
//  PostsTable.swift
//  posts-project
//
//  Created by İrem Kurt on 29.01.2021.
//

import UIKit
import Alamofire

class PostsTable: UITableViewController {
    
    var posts: PostsData? = []
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loading.startAnimating()
        self.loading.color = .systemBlue
        self.loading.style = .large
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        AF.request(url).responseJSON { (response) in
            
            if (response.response?.statusCode == 200) {
                
                self.posts = try? JSONDecoder().decode(PostsData.self, from: response.data!)
                self.tableView.reloadData()
                
                self.loading.stopAnimating()
                self.loading.alpha = 0
                self.loading.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            }
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = posts![indexPath.row]
        cell.textLabel?.text = item.title
      

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = posts![indexPath.row]
        performSegue(withIdentifier: "detail", sender: item)
        print(item.id)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "detail" ) {
            let pt = segue.destination as! Detail
            pt.post = sender as? PostsDatum
        }
    }

}
 
    
