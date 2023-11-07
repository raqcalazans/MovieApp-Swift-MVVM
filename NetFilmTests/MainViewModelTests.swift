//
//  MainViewModelTests.swift
//  NetFilmTests
//
//  Created by Raquel Calazans on 06/11/23.
//

import Quick
import Nimble

@testable import NetFilm

class MainViewModelTests: QuickSpec {
    var viewModel: MainViewModel!
    
    override func spec() {}
}

extension MainViewModelTests {
    func testeBuscarFilmesPopulares() {
        describe("") {
            context("Dado que o app buscou os filmes populares na API com sucesso") {
                var dataPopulares: MovieData?
                var erroPopulares: CustomNetworkError?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "popular", page: "1", completionHandler: { result in
                        switch result {
                        case .success(let data):
                            dataPopulares = data
                        case .failure(let error):
                            erroPopulares = error
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .popular)
                }
                
                // Então
                it("deve exibir a tela de termos e condicoes") {
                    expect(dataPopulares).toNotEventually(beNil())
                    expect(erroPopulares).toEventually(beNil())
                }
            }
        }
    }
}
