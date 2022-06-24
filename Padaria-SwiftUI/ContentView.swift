import SwiftUI

struct ContentView: View {
    let pages = [
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

    var body: some View {
        NavigationView {
            ScrollView (.horizontal,
                        showsIndicators: true) {
                TabView {
                    ForEach(pages) {
                        PageView(imageName: $0.imageName,
                                 title: $0.title,
                                 subtitle: $0.subtitle,
                                 buttonTitle: $0.buttonTitle,
                                 hasButton: $0.hasButton)
                    }
                }
                .background(Color("background"))
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .tabViewStyle(PageTabViewStyle())
            }
                    .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

