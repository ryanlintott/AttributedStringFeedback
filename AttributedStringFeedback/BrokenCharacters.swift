//
//  BrokenCharacters.swift
//  AttributedStringFeedback
//
//  Created by Ryan Lintott on 2021-12-22.
//

import SwiftUI

struct BrokenCharacters: View {
    // Characters that will break IPA regardless of context
    let brokenAlways = #"ǣŁǢǷƿȲȳȜɪʌɔɝəʃʒŋɹ~@#%^*_+=\/{}|"<>"#
        .map { "f" + String($0) }
    
    // Characters that will break IPA when used in isolation
    let brokenInIsolation = #"èéêëēėęÿûüùúūîïíīįìôöòóœøōõàáâäæãåāßśšłžźżçćčñńÈÉÊËĒĖĘŸÛÜÙÚŪÎÏÍĪĮÌÔÖÒÓŒØŌÕÀÁÂÄÆÃÅĀŚŠŽŹŻÇĆČÑŃĀāĒēĪīŌōÞþÐðŪūᚠᚢᚦᚩᚱᚳᚷᚹᚺᛀᛁᛄᛇᛈᛉᛋᛏᛒᛖᛗᛚᛝᛟᛞᚪᚫᚣᛠᛡɛθ`!$&()-[];',.:?"#
        .map { String($0) }
    
    
    func ipaAttributed(_ string: String) -> AttributedString {
        var attributedString = AttributedString(string)
        attributedString.accessibilitySpeechPhoneticNotation = "ga"
        return attributedString
    }
    
    var body: some View {
        List {
            // Working test element
            Text(ipaAttributed("Working Text (says ga)"))
            
            ForEach(brokenAlways, id: \.self) { character in
                Text(ipaAttributed(character))
            }
            
            ForEach(brokenInIsolation, id: \.self) { character in
                Text(ipaAttributed(character))
            }
        }
    }
    
}

struct BrokenCharacters_Previews: PreviewProvider {
    static var previews: some View {
        BrokenCharacters()
    }
}
