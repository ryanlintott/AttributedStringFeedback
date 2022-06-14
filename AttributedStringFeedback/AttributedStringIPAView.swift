//
//  AttributedStringIPAView.swift
//  AttributedStringFeedback
//
//  Created by Ryan Lintott on 2021-12-22.
//

import SwiftUI

struct AttributedStringIPAView: View {
    // This string works fine in the app but not in the widget
    let string1 = "Hello"
    // Strings with unusual characters like ǣ do not work
    let string2 = "Hǣllo"
    
    // Supplying the same very simple IPA to all strings so it is clear whether or not the IPA is spoken
    let ipa = "gɑ"
    
    var ipaString1: AttributedString {
        var string = AttributedString(string1)
        string.accessibilitySpeechPhoneticNotation = ipa
        return string
    }
    
    var ipaString2: AttributedString {
        var string = AttributedString(string2)
        string.accessibilitySpeechPhoneticNotation = ipa
        print(string)
        return string
    }
    
    var ipaString2Workaround: AttributedString {
        // This workaround replaces any broken characters with their closest equivalent. VoiceOver will work correctly but if the user steps through by Character it will show the wrong character in the Text.
        var string = AttributedString(string2.replacingOccurrences(of: "ǣ", with: "æ"))
        string.accessibilitySpeechPhoneticNotation = ipa
        return string
    }
    
    func ipaText(_ attributedString: AttributedString) -> some View {
        HStack {
            Text(attributedString)
            
            // Show the IPA directly to prove the value has been set
            Text(attributedString.accessibilitySpeechPhoneticNotation ?? "")
                .foregroundColor(.red)
                .accessibilityHidden(true)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            ipaText(ipaString1)
            
            ipaText(ipaString2)
            
            ipaText(ipaString2)
                .accessibilityLabel(Text(ipaString2Workaround))
        }
    }
}

struct AttributedStringIPAView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringIPAView()
    }
}
