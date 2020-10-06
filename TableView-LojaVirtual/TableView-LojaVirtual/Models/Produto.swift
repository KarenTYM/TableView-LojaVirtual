//
//  Produto.swift
//  TableView-LojaVirtual
//
//  Created by Fabio Makihara on 02/10/20.
//

import Foundation


enum Categorias:Int {
    case eletronicos = 0
    case lazer = 1
    case eletrodomesticos = 2
}


struct Produto {
    let nome:String
    let preco:String
    let categoaria:Categorias
}



