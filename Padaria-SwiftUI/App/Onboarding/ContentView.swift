import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PageViewModel

    var body: some View {
        NavigationView {
            ScrollView (.horizontal,
                        showsIndicators: true) {
                TabView {
                    ForEach(viewModel.pages) { page in
                        PageView(imageName: page.imageName,
                                 title: page.title,
                                 subtitle: page.subtitle,
                                 buttonTitle: page.buttonTitle,
                                 hasButton: page.hasButton)
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
        ContentView(viewModel: PageViewModel())
    }
}

