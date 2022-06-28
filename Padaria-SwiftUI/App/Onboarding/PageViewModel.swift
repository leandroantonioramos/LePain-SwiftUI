import Foundation

extension PageView {
final class ViewModel: ObservableObject {
    @Published var pages = [
        PageView(imageName: "map",
                 title: "Saiba sempre onde ir",
                 subtitle: "Torne a padaria mais próxima de você, na sua favorita",
                 hasButton: true),
        PageView(imageName: "mappin",
                 title: "E quem não gosta de um pão quentinho?",
                 subtitle: "Sabendo que horas estará pronto, é só ir buscar.",
                 buttonTitle: "Continuar",
                 hasButton: false)
    ]
}
}
