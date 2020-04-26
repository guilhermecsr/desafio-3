require_relative 'disciplina'
require 'byebug'
require_relative 'calculador_cr'
require 'pry'

class Aluno
  def initialize(key = {}, value)
    @matricula = key[:matricula]

    @disciplinas = value
    exibe_cr
  end

  def exibe_cr
    puts "#{@matricula} --- #{CalculadorCr.new(@disciplinas).cr_aluno}"
  end
  # Aluno.new("1", "2", "3", "4").mostrar
end