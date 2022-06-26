import Foundation

final class PerfilViewModel: ObservableObject {
    @Published var perfil = PerfilModel(sceneTitle: "Perfil",
                                        title: "Como você gostaria de ser chamado",
                                        subtitile: "Pode ser seu nome ou apelido, será como vamos te chamar, você escolhe.",
                                        placeHolder: "Digite nome ou apelido",
                                        buttonTitle: "Continuar")
}
