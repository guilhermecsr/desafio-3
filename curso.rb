require 'byebug'
require_relative 'calculador_cr'
require 'pry'

class Curso
  def initialize(key, value)
    @cod_curso = key[:cod_curso]
    @disciplinas = value
  end

  def exibe_cr
    puts "#{@cod_curso} --- #{CalculadorCr.new(@disciplinas).cr_curso}"

  end

  def retorna_dados
    hash = {}
    hash[:cod_curso => @cod_curso] = @disciplinas
    hash
  end
end
