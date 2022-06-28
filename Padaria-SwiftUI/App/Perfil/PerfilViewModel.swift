import Foundation

extension PerfilView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var username: String = ""
        @Published private var showingAlert = false
        @Published var perfil = PerfilModel(sceneTitle: "Perfil",
                                            title: "Como gostaria de ser chamado?",
                                            subtitile: "Pode ser seu nome ou apelido, será como vamos te chamar, você escolhe.",
                                            placeHolder: "Digite nome ou apelido",
                                            buttonTitle: "Continuar")

        func getUsername()
        {
            UserPreferences.shared.hasUserName = username
        }
    }
}
