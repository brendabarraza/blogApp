

import SwiftUI

struct EditView: View {
    
    var crudItem : Posts
    @StateObject var crud = Crud()
    @State private var titulo = ""
    @State private var contenido = ""
    
    var body: some View {
        Form{
            TextField("Title", text: $titulo)
                .onAppear{
                    titulo = crudItem.titulo
                }
            TextEditor(text: $contenido)
                .onAppear{
                    contenido = crudItem.contenido
                }
            Button {
                crud.save(titulo: titulo, contenido: contenido, id: crudItem.id, editar: true)
            } label: {
                Text("Edit post")
            }

        }
    }
}
