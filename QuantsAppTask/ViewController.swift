//
//  ViewController.swift
//  QuantsAppTask
//
//  Created by avula koti on 11/02/20.
//  Copyright © 2020 avula koti. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    var feedsArray = [Feeds]()
    
    //MARK:- Outlets
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            self.tableview.rowHeight = UITableView.automaticDimension
            self.tableview.estimatedRowHeight = 40
        }
    }
    //MARK:- Application LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getFeed()
        
    }
    
    //MARK:- Functions
    func  getFeed() {
        let url = URL(string: "https://api.androidhive.info/feed/feed.json")
        URLSession.shared.dataTask(with: url!){ (data, response, error)
            in
            guard let data = data else {
                return
            }
            do {
                let json = try JSON(data:data)
                let results = json["feed"]
                print(json)
                //  print(results)
                for array in results.arrayValue {
                    self.feedsArray.append(Feeds(json: array))
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                        self.tableview.delegate = self
                        self.tableview.dataSource = self
                    }
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

//MARK:- Extension
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "customTableViewCell") as! customTableViewCell
               cell.nameLabel.text = (feedsArray[indexPath.row].name!!)
        cell.statusLabel.text = (feedsArray[indexPath.row].status!!)
        cell.statusLabel.numberOfLines = 0
                cell.timeLabel.text = (feedsArray[indexPath.row].timeStamp!!)
                cell.statusLabel.numberOfLines = 0
                cell.profilePicImage.sd_setImage(with: URL(string: (feedsArray[indexPath.row].profilepic!!)), placeholderImage: UIImage(named: "ProfilePlaceholder"))
               cell.feedImage.sd_setImage(with: URL(string:(feedsArray[indexPath.row].image!!)), placeholderImage: UIImage(named: "FeedPlaceHolder"))
        
        return cell
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 380
    //    }
    
}

