//
//  ViewController.swift
//  FloatingButtons
//
//  Created by Prashant G on 1/2/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var repeatButton: UIButton!
    @IBOutlet var shuffleButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    // MARK: - Properties
    var shuffleButtonCenter: CGPoint!
    var likeButtonCenter: CGPoint!
    var repeatButtonCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Save destination location
        shuffleButtonCenter =  shuffleButton.center
        likeButtonCenter    =  likeButton.center
        repeatButtonCenter  =  repeatButton.center
        
        // Move all buttons below more button on start
        shuffleButton.center = moreButton.center
        likeButton.center    = moreButton.center
        repeatButton.center  = moreButton.center
        self.shuffleButton.alpha = 0.0
        self.likeButton.alpha    = 0.0
        self.repeatButton.alpha  = 0.0
        view.bringSubviewToFront(moreButton)
    }

    @IBAction func handleMoreButtonTapped(_ sender: UIButton) {
        
        toggleButton(button: sender, onImage: UIImage(named: "more_On")!, offImage: UIImage(named: "more_Off")!)
        
        if moreButton.currentImage == UIImage(named: "more_Off")! {
            // Collapse
            UIView.animate(withDuration: 0.3) {
                self.shuffleButton.alpha = 0.0
                self.likeButton.alpha    = 0.0
                self.repeatButton.alpha  = 0.0
                
                self.shuffleButton.center = self.moreButton.center
                self.likeButton.center    = self.moreButton.center
                self.repeatButton.center  = self.moreButton.center
            }
        }
        else{
            // Expand
            UIView.animate(withDuration: 0.3) {
                self.shuffleButton.alpha = 1.0
                self.likeButton.alpha    = 1.0
                self.repeatButton.alpha  = 1.0
                
                self.shuffleButton.center = self.shuffleButtonCenter
                self.likeButton.center    = self.likeButtonCenter
                self.repeatButton.center  = self.repeatButtonCenter
            }
        }
    }
    
    @IBAction func handleShuffleButtonTapped(_ sender: UIButton) {
        toggleButton(button: sender, onImage: UIImage(named: "shuffle_On")!, offImage: UIImage(named: "shuffle_Off")!)
    }
    
    @IBAction func handleRepeatButtonTapped(_ sender: UIButton) {
        toggleButton(button: sender, onImage: UIImage(named: "repeat_On")!, offImage: UIImage(named: "repeat_Off")!)
    }
    
    @IBAction func handleLikeButtonTapped(_ sender: UIButton) {
        toggleButton(button: sender, onImage: UIImage(named: "like_On")!, offImage: UIImage(named: "like_Off")!)
    }
    
    func toggleButton(button: UIButton, onImage: UIImage, offImage: UIImage) {
        if button.currentImage == offImage {
            button.setImage(onImage, for: .normal)
        }
        else{
            button.setImage(offImage, for: .normal)
        }
    }
    
}

