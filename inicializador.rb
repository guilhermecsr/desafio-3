require_relative 'aluno'
require_relative 'curso'
require_relative 'formatador_dados'
require_relative 'leitor_csv'
require 'csv'

class Inicializador
  def initialize
    @curso = LeitorCsv.new.le_dados_curso
    @aluno = LeitorCsv.new.le_dados_aluno
    @matricula = LeitorCsv.new.le_dados_curso_matricula
    imprime
  end

  def imprime
    puts "CR dos alunos: "
    puts "Mat --- CR "
    puts ""

    @aluno.each do |k, v|
      Aluno.new(k, v).exibe_cr
    end
    puts "* * * * * *"
    puts "CR dos cursos"
    puts "Cur --- CR"
    puts ""
    @curso.each do |k, v|
      Curso.new(k, v).exibe_cr
    end
    puts "* * * * * *"
    puts "Média de CR dos cursos"
    puts "Cur --- Média CR"
    puts ""
    # reune_dados
    FormatadorDados.new(@aluno, @matricula)
  end
  Inicializador.new
end