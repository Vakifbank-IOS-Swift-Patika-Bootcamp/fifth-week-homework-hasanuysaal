//
//  PopUpView.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 27.11.2022.
//

import UIKit

protocol PopUpViewDelegate: AnyObject{
    func xBtnPressed()
}

class PopUpView: UIView {
    
    @IBOutlet weak var episodeCharactersTextView: UITextView!
    weak var delegate: PopUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "PopUpView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            setViewAppearance(view: view)
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    private func setViewAppearance(view: UIView){
        view.layer.cornerRadius = 25.0
        view.layer.borderWidth = 3.0
        view.layer.cornerRadius = 25.0
    }
    
    @IBAction func xButtonPressed(_ sender: Any) {
        delegate?.xBtnPressed()
        self.removeFromSuperview()
    }
}
