//
//  PresetAppearanceConfigs.swift
//  Tabman-Example
//
//  Created by Merrick Sapsford on 10/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation
import Tabman

struct DooerTabStyle {
    
    static var white: TabmanBar.Appearance = {
        let appearance = TabmanBar.Appearance.defaultAppearance
        // Behaviour
        appearance.indicator.bounces = true
        appearance.indicator.compresses = false
        // Colors
        appearance.style.background = .solid(color: UIColor.white)
        appearance.text.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        appearance.state.selectedColor = UIColor(displayP3Red: 72/255, green: 137/255, blue: 250/255, alpha: 1)
        appearance.indicator.color = UIColor(displayP3Red: 72/255, green: 137/255, blue: 250/255, alpha: 1)
        appearance.state.color = UIColor(displayP3Red: 95/255, green: 95/255, blue: 105/255, alpha: 1).withAlphaComponent(1)
        appearance.style.bottomSeparatorColor = UIColor.lightGray
        // Layout
        appearance.layout.itemVerticalPadding = 8.0
        appearance.indicator.bounces = true
        appearance.indicator.lineWeight = .normal
        appearance.layout.edgeInset = 32.0
        appearance.layout.interItemSpacing = 40.0
        appearance.layout.height = .explicit(value: 48)
        return appearance
    }()
    
}
