//
//  UserProfileViewController.swift
//  FlightHedge-xcode
//
//  Created by Austin Potts on 1/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
   
    
    let serviceController = ServiceController()
        
        let data = [
            ServiceProvided(title: "Idk", imageName: #imageLiteral(resourceName: "mockCell"), url: "part"),
            ServiceProvided(title: "Idk", imageName: #imageLiteral(resourceName: "mockCell"), url: "part"),
            ServiceProvided(title: "Idk", imageName: #imageLiteral(resourceName: "mockCell"), url: "part"),
            ServiceProvided(title: "Idk", imageName: #imageLiteral(resourceName: "mockCell"), url: "part"),

           
                
                
                ]
        
        fileprivate let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
            return cv
        }()
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
                userImage.layer.masksToBounds = true
                userImage.layer.cornerRadius = userImage.bounds.width / 2

                view.addSubview(collectionView)
                collectionView.backgroundColor = .clear
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 435).isActive = true
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
                
    //            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        
                collectionView.delegate = self
                collectionView.dataSource = self //Methods wont run if these arent called
            }
        
        
        
     

    }



    extension UserProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/2)
           }
           
         
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return serviceController.serviceProvided.count
           }
            
          
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
                
                let service = serviceController.serviceProvided[indexPath.row]
                cell.data = service
                return cell
            
            }
            
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "ViewCalendarSegue" {
    //            guard let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
    //                let partSelectVC = segue.destination as? ScheduleServiceViewController else{return}
    //
    //            let selectedPart = partController.part[indexPath]
    //            partSelectVC.part = selectedPart
    //
    //        }
    //
    //     }
        
       
        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//               if segue.identifier == "ViewServiceSegue" {
//                   guard let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
//                       let serviceVC = segue.destination as? SearchServiceViewController else {return}
//
//                let selectedService = serviceController.serviceProvided[indexPath]
//                serviceVC.serviceProvided = selectedService
//               }
//           }
//        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
               performSegue(withIdentifier: "ViewServiceSegue", sender: indexPath)
           }
        
        
    }

    class CustomCell: UICollectionViewCell {
        
        
        var data: ServiceProvided? {
            didSet{
                guard let data = data else {return}
                bg.image = data.image
            }
        }
        
        fileprivate let bg: UIImageView = {
            let iv = UIImageView()
            iv.image = #imageLiteral(resourceName: "mockCell")
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 15
            
            
            
            
            
            return iv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(bg)
            bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }
