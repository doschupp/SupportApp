//
//  ComputerNameSubview.swift
//  Support
//
//  Created by Jordy Witteman on 17/03/2021.
//

import SwiftUI

struct ComputerNameSubview: View {
    
    // Get  computer info from functions in class
    @EnvironmentObject var computerinfo: ComputerInfo
    
    // Get preferences or default values
    @StateObject var preferences = Preferences()
    
    // Make UserDefaults easy to use
    let defaults = UserDefaults.standard
    
    // Dark Mode detection
    @Environment(\.colorScheme) var colorScheme
    
    // Set the custom color for all symbols depending on Light or Dark Mode.
    var customColor: String {
        if colorScheme == .light && defaults.string(forKey: "CustomColor") != nil {
            return preferences.customColor
        } else if colorScheme == .dark && defaults.string(forKey: "CustomColorDarkMode") != nil {
            return preferences.customColorDarkMode
        } else {
            return preferences.customColor
        }
    }
    
    var body: some View {
        
//        InfoItem(title: NSLocalizedString("Computer Name", comment: ""), subtitle: computerinfo.hostname, image: computerinfo.computerNameIcon, symbolColor: Color(NSColor(hex: "\(customColor)") ?? NSColor.controlAccentColor), hoverEffectEnable: false)
        ItemDouble(title: NSLocalizedString("Computer Name", comment: ""), secondTitle: NSLocalizedString("Model", comment: ""), subtitle: computerinfo.hostname, secondSubtitle: "\(computerinfo.modelShortName) \(computerinfo.modelYear)", linkType: "App", link: "com.apple.AboutThisMacLauncher", image: computerinfo.computerNameIcon, symbolColor: Color(NSColor(hex: "\(customColor)") ?? NSColor.controlAccentColor), hoverEffectEnable: true)
        
    }
}

struct ComputerNameSubview_Previews: PreviewProvider {
    static var previews: some View {
        ComputerNameSubview()
    }
}
