import SwiftUI

struct PerfilView: View {
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack (alignment: .top) {
            Color("background").edgesIgnoringSafeArea(.all)
            VStack (spacing: 20) {
                VStack (spacing: 15) {
                    Text(viewModel.perfil.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Text(viewModel.perfil.subtitile)
                        .font(.body)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .multilineTextAlignment(.leading)
                    HStack (spacing: 10) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                        TextField(viewModel.perfil.placeHolder,
                                  text: $viewModel.username)
                        .padding(.horizontal , 15)
                        .frame(height: 40.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(colorScheme == .dark ? Color.white : Color.black,
                                        lineWidth: 2)
                        )
                    }
                    Spacer()
                    VStack {
                        NavigationLink(destination: PerfilView(viewModel: viewModel)) {
                            Text(viewModel.perfil.buttonTitle)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.getUsername()
                        })
                        .frame(minWidth: 0,
                               maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(colorScheme == .dark ? Color.white : Color.black,
                                        lineWidth: 2))
                        .isHidden(viewModel.username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(viewModel.perfil.sceneTitle)
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView(viewModel: PerfilView.ViewModel())
            .previewDevice("iPhone SE")
            .environment(\.colorScheme, .dark)

        PerfilView(viewModel: PerfilView.ViewModel())
            .previewDevice("iPhone 13 Pro Max")
            .environment(\.colorScheme, .light)
    }
}
