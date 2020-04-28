require 'byebug'
require_relative 'calculador_cr'
require 'pry'
#classe para retornar os dados dos alunos e imprimir os valores
class Aluno
  def initialize(key, value)
    @matricula = key[:matricula]
    @disciplinas = value
  end

  def exibe_cr
    puts "#{@matricula} --- #{CalculadorCr.new(@disciplinas).calcula_cr}"
  end

  def retorna_dados
    hash = {}
    hash[:matricula => @matricula] = CalculadorCr.new(@disciplinas).calcula_cr
    hash
  end
end