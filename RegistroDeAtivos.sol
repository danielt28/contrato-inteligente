// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistroDeAtivos {
    struct Ativo {
        string nome;
        uint valor;
        uint dataRegistro;
    }

    mapping(uint => Ativo) public ativos;
    uint public totalAtivos;

    event AtivoRegistrado(uint id, string nome, uint valor, uint dataRegistro);

    function registrarAtivo(string memory nome, uint valor) public {
        uint id = totalAtivos++;
        ativos[id] = Ativo(nome, valor, block.timestamp);
        emit AtivoRegistrado(id, nome, valor, block.timestamp);
    }

    function consultarAtivo(uint id) public view returns (string memory, uint, uint) {
        require(id < totalAtivos, "ID de ativo invalido");
        Ativo memory ativo = ativos[id];
        return (ativo.nome, ativo.valor, ativo.dataRegistro);
    }
}
