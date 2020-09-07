//
//  ContentView.swift
//  Custom Two-Way Bindings
//
//  Created by BugaCo on 2020/9/5.
//

import SwiftUI

struct ContentView: View {
    @State var agreeToTerms = false
    @State var agreeToPrivacyPolicy = false
    @State var agreeToEmail = false
    
    var body: some View {
        
        let agreeToAll = Binding(get: {
            return agreeToTerms && agreeToPrivacyPolicy && agreeToEmail
        }, set: {
            agreeToTerms = $0
            agreeToPrivacyPolicy = $0
            agreeToEmail = $0
        })
        
        return Form {
            Toggle("Agree to terms", isOn: $agreeToTerms)
            Toggle("Agree to privacy policy", isOn: $agreeToPrivacyPolicy)
            Toggle("Agree to privacy policy", isOn: $agreeToEmail)
            Toggle("Agree to all", isOn: agreeToAll)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
