import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
           self.hidden()
        } else {
           self
        }
    }

    @ViewBuilder func isDisabled(_ disable: Bool) -> some View {
        if disable {
            self.disabled(disable)
        } else {
            self
        }
    }
}
