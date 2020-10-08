//
//  ProdutoVC.swift
//  TableView-LojaVirtual
//
//  Created by Fabio Makihara on 02/10/20.
//

import UIKit




// MARK: class ProdutosVC

class ProdutosVC: UIViewController {

    
    // MARK: IBOutlet
    
    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias:[String] = ["Eletrônicos", "Lazer", "Eletrodomésticos"]
    
    var produtos:[Produto] = [Produto(nome:"Bicicleta", preco: "R$ 1.500,00", categoaria: .lazer),
                              Produto(nome:"Bola de futebol", preco:"R$ 99,00", categoaria: .lazer),
                              Produto(nome:"Macbook", preco:"R$ 10.000,00", categoaria: .eletronicos),
                              Produto(nome: "Geladeira", preco: "R$ 5.000,00", categoaria: .eletrodomesticos),
                              Produto(nome: "TV", preco:"R$ 5.500,00", categoaria: .eletrodomesticos),
                              Produto(nome: "Fogão", preco:"R$ 2.000,00", categoaria: .eletrodomesticos)]
    
    
    // MARK: Configuraçoes da TableView
    
    // método que configura a tableView
    private func configTableView() {
        // quem vai controlar o produtosTableView (a table view) é essa view controller (ProdutosVC)
        produtosTableView.dataSource = self
        produtosTableView.delegate = self
        // limpa células em branco
        self.produtosTableView.tableFooterView = UIView(frame: .zero)
        
        // Configuração criada para poder usar a Xib (TableViewCell)
        // registrando a Celula (Xib) pra poder usar dentro de uma TableView
        // UINib = inicializa o arquivo do xib da célula
        // nibName = nome do aquivo
        // forCellReusseIdentifier = identifier da celula
        self.produtosTableView.register(UINib(nibName: "ProdutoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProdutoTableViewCell")
    }
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
        
    }

    
    // MARK: Definindo número de cálulas por seção
    
    // método que me fala quantas células vai ter em cada seção
    private func numeroDeItensPorCategoria(section:Int) -> Int {
        
        var arrayProdutosFiltrados:[Produto] = []
        for value in self.produtos {
            if value.categoaria.rawValue == section {
                arrayProdutosFiltrados.append(value)
            }
        }
        
        return arrayProdutosFiltrados.count
        
//        switch section {
//        case Categorias.eletronicos.rawValue:
//            return 3
//        case Categorias.lazer.rawValue:
//            return 2
//        case Categorias.eletrodomesticos.rawValue:
//            return 1
//        default:
//            return 0
//        }
    }
    
    
    // MARK: carregando os itens para cada categoria
    
    // vai ser chamada em cellForRowAt
    func loadArrayFiltrado(section:Int) -> [Produto] {
        
        // Filtro --> filtra só quem está igual à section
        // Varre o array (produtos) e vê se a categoria é igual à da section
        // Posso colocar quantos filtros eu quiser
        let arrayFiltrado = self.produtos.filter({$0.categoaria.rawValue == section})
        return arrayFiltrado
    }
    
}



// MARK: extension -> Table View Data Source

extension ProdutosVC: UITableViewDataSource {
    
    // No caso, é pra definir o número de categorias
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorias.count  // sempre pega o numero de categorias que tem no array
    }
    
    
    // método essencial para estar em conformidade com o protocolo UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.numeroDeItensPorCategoria(section: section)
        
    }
    
    
    // método essencial para estar em conformidade com o protocolo UITableViewDataSource
    // Que tipo de célula eu espero dentro dos índex
    // metodo é disparado a quantidade de células que tem em cada seção
    // _ tableView = tableView que dispara o método
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // variável não usa mais porque vamos usar o xib
//        let cell = produtosTableView.dequeueReusableCell(withIdentifier: "ProdutosCell", for: indexPath)
        
        // FORMA 1 --> fazer a separação dos produtos por categoria
//        var arrayProdutosFiltados:[Produto] = []
//        for value in self.produtos {
//            if value.categoaria.rawValue == indexPath.section {
//                arrayProdutosFiltados.append(value)
//            }
//        }
        
        // FORMA 2 --> chama o metodo que faz a separação dos produtos por categoria
        let arrayProtudosFiltrados:[Produto] = self.loadArrayFiltrado(section: indexPath.section)
        
        // Montagem da célula
        // Título = nome do produto  -  Subtítulo = preço do produto
        // variável não usa mais porque vamos usar o xib
//        cell.textLabel?.text = arrayProtudosFiltrados[indexPath.row].nome
//        cell.detailTextLabel?.text = arrayProtudosFiltrados[indexPath.row].preco
//
        // variável não usa mais porque vamos usar o xib
//        print(indexPath.row)
//        return cell
        
        
        // crio a variável para colocar ela na tableView
        // crio a variavel cell pra eu carregar a celula dentro da tableView
        // poderia ter colocado: ... = tableView.dequeueReusableCell(...)...
        let cell:ProdutoTableViewCell? = self.produtosTableView.dequeueReusableCell(withIdentifier: "ProdutoTableViewCell", for: indexPath) as? ProdutoTableViewCell
        // as? ProdutoTableViewCell --> transoforma o retorno no tipo ProdutoTableViewCell, porque o método retorna UITableViewCell e embora o ProdutoTableViewCell seja uma filha UITableViewCell, não as mesmas
        
        cell?.setup(produto: arrayProtudosFiltrados[indexPath.row])
        
        // faço um ternário para evitar que o app quebre se a célula não tiver nada -> nesse caso, retorna uma TableView vazia
        return cell ?? UITableViewCell()
    }
    
    
    // método que coloca o nome das seções
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categorias[section]
    }
        
}



// MARK: extension -> Delegate

extension ProdutosVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row) // indexPath imprimi a seção e a célula
    }
}
