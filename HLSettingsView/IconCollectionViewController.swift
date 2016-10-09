//
//  CollectionViewController.swift
//  HLSettingsView
//
//  Created by Hanjie Liu on 9/10/16.
//  Copyright © 2016 Hanjie Liu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "IconCell"

//input your own options
let images = ["Airplane", "Battery", "Cell", "Cloud", "Fingerprint", "Hand", "Lock", "Message", "Photos", "Shutdown", "Wi-Fi", "Battery", "Cell", "Cloud", "Fingerprint", "Hand", "Lock"]

let options = ["Air Mode", "Battery", "Cellular", "iCloud", "Touch ID", "Privacy", "Password", "Mail", "Photos", "Turn Off", "Wi-Fi", "Battery", "Cellular", "iCloud", "Touch ID", "Privacy", "Password"]


class IconCollectionViewController: UICollectionViewController, UIPreviewInteractionDelegate {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var optionVC = UIViewController()
    var previewInteraction: UIPreviewInteraction!
    
    let blurView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = SpringboardLayout()
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
        self.collectionView?.setCollectionViewLayout(layout, animated: false)
        
        optionVC = sb.instantiateViewController(withIdentifier: "option")
        
        previewInteraction = UIPreviewInteraction(view: view)
        previewInteraction.delegate = self
        
        blurView.frame = (view.bounds)
        
        view.insertSubview(blurView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 17
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
        
        cell.name = options[indexPath.row]
        cell.imageName = images[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.parent!.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    // MARK: Preview Interaction
    func previewInteractionShouldBegin(_ previewInteraction: UIPreviewInteraction) -> Bool {
        view!.bringSubview(toFront: blurView)
        
        let location = previewInteraction.location(in: collectionView!)
        let path = self.collectionView?.indexPathForItem(at: location)
        if let p = path{
            let highlightedCell = self.collectionView!.cellForItem(at: p)
            
            //do something with the cell
        }
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.effect = UIBlurEffect(style: .light)
        }
        
        return true
    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdatePreviewTransition transitionProgress: CGFloat, ended: Bool) {
        if ended {
            self.collectionView!.allowsSelection = false // prevent post selection
            
            optionVC.view.backgroundColor = UIColor.clear;
            self.modalPresentationStyle = .currentContext
            
            optionVC.providesPresentationContextTransitionStyle = true
            optionVC.definesPresentationContext = true
            optionVC.modalPresentationStyle = .overCurrentContext
                        
            present(optionVC, animated: false, completion: nil)
        }

    }
    
    func previewInteractionDidCancel(_ previewInteraction: UIPreviewInteraction) {
        UIView.animate(withDuration: 0.3) {
            self.blurView.effect = nil
        }
        
        view!.bringSubview(toFront: collectionView!)

    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdateCommitTransition transitionProgress: CGFloat, ended: Bool) {
        
        if ended{
            optionVC.dismiss(animated: false, completion: nil)
            view!.bringSubview(toFront: collectionView!)

            self.parent!.performSegue(withIdentifier: "toDetail", sender: self)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
