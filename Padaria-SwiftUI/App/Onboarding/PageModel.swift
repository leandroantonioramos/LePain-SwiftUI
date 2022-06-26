import Foundation
import SwiftUI

struct PageModel: Identifiable {
    @State private var onboardingCompleteStatus = false

    var id = UUID()
    var imageName: String? = nil
    var title: String? = nil
    var subtitle: String? = nil
    var buttonTitle: String? = nil
    var hasButton: Bool? = nil

    init(imageName: String? = nil,
         title: String? = nil,
         subtitle: String? = nil,
         buttonTitle: String? = nil,
         hasButton: Bool? = nil)
    {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.hasButton = hasButton
    }
}
