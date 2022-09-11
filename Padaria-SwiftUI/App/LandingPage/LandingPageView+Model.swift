import SwiftUI

extension LandingPageView {
    final class Model: ObservableObject {
        @Published var searchText = ""
    }
}
