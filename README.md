# AttributedStringFeedback
Apple Feedback for issues with attributed string and VoiceOver

# VoiceOver ignores phonetic notation on widgets
When accessibilitySpeechPhoneticNotation is added to an AttributedString, VoiceOver ignores this parameter and reads the original string when used in a Text view in a Widget.

## How to Reproduce
Run the app on device and use VoiceOver to select the Text in the widget. - It will read out “Hello” instead of “ga”

## Notes
The accessibilitySpeechPhoneticNotation is definitely being set. It just isn’t being read by VoiceOver.
