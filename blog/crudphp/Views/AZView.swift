

import SwiftUI

struct AZView: View {
    @StateObject var crud = Crud()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(crud.posts.sorted(by: { $0.titulo < $1.titulo }), id: \.id) { item in
                    NavigationLink(destination: DetailView(crudItem: item)) {
                        ZStack {
                            AsyncImage(url: URL(string: item.imagen)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width / 3 - 16, height: UIScreen.main.bounds.width / 3 - 16)
                                    .clipped()
                            } placeholder: {
                                Color.gray
                                    .frame(width: UIScreen.main.bounds.width / 3 - 16, height: UIScreen.main.bounds.width / 3 - 16)
                            }

                            Color.black.opacity(0.6)
                                .frame(width: UIScreen.main.bounds.width / 3 - 16, height: UIScreen.main.bounds.width / 3 - 16)
                                .cornerRadius(8)

                            Text(item.titulo)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(8)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(" ")
        .onAppear {
            crud.getData()
        }
    }
}









