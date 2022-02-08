//
//  ViewController.swift
//  PhotoFrame
//
//  Created by dellirium on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var clickToStart: UIButton!
    
    @IBOutlet weak var photoFrame: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoMoment: UILabel!
    @IBOutlet weak var photoPlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAccessibility()
    }
    
    // MARK: - Configura a Acessibilidade para o Voice Over
    func setUpAccessibility() {
        appName.isAccessibilityElement = true
        appName.accessibilityLabel = "photo frame"
        appName.accessibilityTraits = .header // vai orientar que tipo de elemento é na tela. mostra automaticamente como static text
        
        clickToStart.isAccessibilityElement = true
        clickToStart.accessibilityLabel = "Começar"
        clickToStart.accessibilityHint = "Toque duas vezes para começar" // dica de interação
        
        guard let photoPlace = photoPlace.text, let photoMoment = photoMoment.text else { return }
        self.photoPlace.isAccessibilityElement = false
        self.photoMoment.isAccessibilityElement = false
        
        photo.isAccessibilityElement = true
        photo.accessibilityLabel = "\(photoMoment) no \(photoPlace)"
        
        UIAccessibility.post( notification: .screenChanged, argument: clickToStart ) // para o voice over focar em outro elemento que não seja o .header; e o screen changed é o mais prioritário na tela
    }


}

