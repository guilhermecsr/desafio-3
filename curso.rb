require_relative 'disciplina'
require 'byebug'
require_relative 'calculador_cr'
require 'pry'

class Curso
  def initialize(key, value)
    @cod_curso = key[:cod_curso]
    @disciplinas = value
    exibe_cr
  end

  def exibe_cr
    puts "#{@cod_curso} --- #{CalculadorCr.new(@disciplinas).cr_curso}"

  end
end
