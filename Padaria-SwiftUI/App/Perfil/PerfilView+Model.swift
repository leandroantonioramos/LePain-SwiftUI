import Foundation

extension PerfilView {
    struct Model: Identifiable {
        var id = UUID()
        var sceneTitle: String
        var title: String
        var subtitile: String
        var placeHolder: String
        var buttonTitle: String
    }
}
