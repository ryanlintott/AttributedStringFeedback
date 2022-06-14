//
//  AttributedStringIPAWidgetView.swift
//  AttributedStringFeedback
//
//  Created by Ryan Lintott on 2021-12-22.
//

import SwiftUI
import WidgetKit

struct AttributedStringIPAWidgetView: View {
    let string = "Hello"

    // Supplying a very simple IPA so it is clear whether or not the IPA is spoken
    let ipa = "gɑ"
    
    var ipaString: AttributedString {
        var string = AttributedString(string)
        string.accessibilitySpeechPhoneticNotation = ipa
        return string
    }
    
    func ipaText(_ attributedString: AttributedString) -> some View {
        HStack {
            // This should present the string "Hello" but read the IPA "ga"
            Text(attributedString)
            
            // Show the IPA directly to prove the value has been set
            Text(attributedString.accessibilitySpeechPhoneticNotation ?? "")
                .foregroundColor(.red)
                .accessibilityHidden(true)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            ipaText(ipaString)
        }
    }
}

struct AttributedStringIPAView_Previews: PreviewProvider {
    static var previews: some View {
//        AttributedStringIPAWidgetView()
        ContainerRelativeShape()
            .inset(by: 3)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
