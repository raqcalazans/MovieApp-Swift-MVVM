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
    func testesBuscarFilmes() {
        testeBuscarFilmesPopulares()
        testeBuscarFilmesTopRated()
        testeBuscarFilmesUpcoming()
        testeBuscarFilmesLatest()
        testeBuscarFilmesErro()
    }
    
    func testeBuscarFilmesPopulares() {
        describe("Testando a busca de Filmes Populares") {
            context("Dado que o app buscou os filmes populares na API com sucesso") {
                var dataPreenchida: Bool?
                var erroPreenchido: Bool?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "popular", page: "1", completionHandler: { result in
                        switch result {
                        case .success( _):
                            dataPreenchida = true
                        case .failure( _):
                            erroPreenchido = true
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .popular)
                }
                
                // Então
                it("deve exibir preencher a variavel data sem erros") {
                    expect(dataPreenchida).toNotEventually(beTrue())
                    expect(erroPreenchido).toEventually(beNil())
                }
            }
        }
    }
    
    func testeBuscarFilmesTopRated() {
        describe("Testando a busca de Filmes Top Rated") {
            context("Dado que o app buscou os filmes top rated na API com sucesso") {
                var dataPreenchida: Bool?
                var erroPreenchido: Bool?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "top_rated", page: "1", completionHandler: { result in
                        switch result {
                        case .success( _):
                            dataPreenchida = true
                        case .failure( _):
                            erroPreenchido = true
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .topRated)
                }
                
                // Então
                it("deve exibir preencher a variavel data sem erros") {
                    expect(dataPreenchida).toNotEventually(beTrue())
                    expect(erroPreenchido).toEventually(beNil())
                }
            }
        }
    }
    
    func testeBuscarFilmesUpcoming() {
        describe("Testando a busca de Filmes Upcoming") {
            context("Dado que o app buscou os filmes upcoming na API com sucesso") {
                var dataPreenchida: Bool?
                var erroPreenchido: Bool?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "upcoming", page: "1", completionHandler: { result in
                        switch result {
                        case .success( _):
                            dataPreenchida = true
                        case .failure( _):
                            erroPreenchido = true
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .upcoming)
                }
                
                // Então
                it("deve exibir preencher a variavel data sem erros") {
                    expect(dataPreenchida).toNotEventually(beTrue())
                    expect(erroPreenchido).toEventually(beNil())
                }
            }
        }
    }
    
    func testeBuscarFilmesLatest() {
        describe("Testando a busca de Filmes Latest") {
            context("Dado que o app buscou os filmes latest na API com sucesso") {
                var dataPreenchida: Bool?
                var erroPreenchido: Bool?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "now_playing", page: "1", completionHandler: { result in
                        switch result {
                        case .success( _):
                            dataPreenchida = true
                        case .failure( _):
                            erroPreenchido = true
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .latest)
                }
                
                // Então
                it("deve exibir preencher a variavel data sem erros") {
                    expect(dataPreenchida).toNotEventually(beTrue())
                    expect(erroPreenchido).toEventually(beNil())
                }
            }
        }
    }
    
    func testeBuscarFilmesErro() {
        describe("Testando a busca de Filmes com string errada") {
            context("Dado que o app buscou os filmes latest na API com sucesso") {
                var dataPreenchida: Bool?
                var erroPreenchido: Bool?
                
                beforeEach {
                    // Dado que
                    self.viewModel.service?.getMovieData(movieType: "mock", page: "1", completionHandler: { result in
                        switch result {
                        case .success( _):
                            dataPreenchida = true
                        case .failure( _):
                            erroPreenchido = true
                        }
                    })
                    
                    // Quando
                    self.viewModel.getMovies(movieType: .latest)
                }
                
                // Então
                it("deve exibir preencher a variavel erro") {
                    expect(dataPreenchida).toNotEventually(beNil())
                    expect(erroPreenchido).toEventually(beTrue())
                }
            }
        }
    }
}
