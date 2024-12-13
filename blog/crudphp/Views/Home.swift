

import SwiftUI

struct Home: View {
    
    @StateObject var crud = Crud()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(crud.posts, id: \.id) { item in
                    NavigationLink(destination: DetailView(crudItem: item)) {
                        CeldaView(imagen: item.imagen, titulo: item.titulo, contenido: item.contenido)
                    }
                }
            }
            .navigationTitle(" ")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PostView()) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: AZView()) {
                        Image(systemName: "textformat.abc")
                            .font(.title2)
                    }
                }
            }
            .onAppear {
                crud.getData()
            }
        }
    }
}


struct CeldaView: View {
    var imagen: String
    var titulo: String
    var contenido: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.system(size: 20, weight: .bold)) 
            
            AsyncImage(url: URL(string: imagen)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.red
            }
            .clipShape(RoundedRectangle(cornerRadius: 5)) 
            
            Text(contenido)
                .font(.system(size: 14))
        }
    }
}

