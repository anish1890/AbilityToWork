//
//  MainHomeVC.swift
//  KidsLogic
//
//  Created by MAC  on 20/01/2024.
//

import UIKit


class MainHomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var tablMainMenu: UICollectionView!
    
    let numberOfItemsPerRow: CGFloat = 2
       let spacingBetweenCells: CGFloat = 10
    
    var arrMaincat = ["card_one", "card_two", "card_three", "card_four"]
    var arrMainName = ["Learning","Video learning","Look & Choose","Listen & Guess"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = GlobleConstants.PRE_SCHOOL_TITLE
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMaincat.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCatCollectionViewCell
        cell.imgMainCAt.layer.cornerRadius = 12
        cell.imgMainCAt.image = UIImage(named: arrMaincat[indexPath.row])
        cell.imgMainCAt.clipsToBounds = true
        cell.catName.text = arrMainName[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openHomePage(indexVal: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let totalSpacing = spacingBetweenCells * (numberOfItemsPerRow - 1)
            let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
            return CGSize(width: width, height: width) // Adjust height as needed
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return spacingBetweenCells
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return spacingBetweenCells
        }
    
    func openHomePage(indexVal: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! SchoolHomeVC
        vc.selectedMainCat = indexVal
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


