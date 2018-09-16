//
//  View.swift
//  QuizzSchoolApp
//
//  Created by didier arrigoni on 14.09.18.
//  Copyright © 2018 Didier Arrigoni. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    // MARK: - Outlets et variables
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!

    // énumération pour les styles du label
    enum Style {
        case juste, faux, enAttente
    }

    // cette propriété va définir l'apparence générale de la vue, qui présente 3 choix possibles.
    var style: Style = .enAttente { // la valeur par défaut est .attente
        didSet {
            setStyle(style)
        }
    }

    var title = "" {
        // on utilise l'observation des propriétés > dès que la propriété title est modifiée, la méthode didSet sera exécutée.
        didSet {
            label.text = title
        }
    }
  
    // MARK: - Méthodes projet

    private func setStyle(_ style: Style) {
        switch style {
        case .juste:
            backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.9254901961, blue: 0.6274509804, alpha: 1)
            icon.image = UIImage(named: "Icon correct")
            icon.isHidden = false
        case .faux:
            backgroundColor = UIColor(displayP3Red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case .enAttente:
            backgroundColor = UIColor(white: 0.5, alpha: 1)
            icon.isHidden = true
        default:
            break
        }
    }
}
