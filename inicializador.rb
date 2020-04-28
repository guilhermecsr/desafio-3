require_relative 'aluno'
require_relative 'curso'
require_relative 'formatador_dados'
require_relative 'leitor_csv'
require 'csv'
# classe para facilitar a execucao do codigo
class Inicializador
  def initialize
    @curso = LeitorCsv.new.le_dados_curso
    @aluno = LeitorCsv.new.le_dados_aluno
    @matricula = LeitorCsv.new.le_dados_curso_matricula
    imprime
  end
#metodo para centralizar os cabecalhos dos outputs
# provavelmente durante uma lapidacao mais intesa eu colocaria a impressao dos valores aqui tambem
  def imprime
    puts "CR dos alunos: "
    puts "Mat --- CR "
    puts ""
    #aqui o @aluno eh um hash de chave matriculas e valores disciplinas
    # para cada disciplina tem um array com as notas e as carga horarias
    @aluno.each do |k, v|
      Aluno.new(k, v).exibe_cr
    end
    puts "* * * * * *"
    puts "CR dos cursos"
    puts "Cur --- CR"
    puts ""
    #aqui o @curso eh um hash de chave cod curso e valores disciplinas
    # para cada disciplina um array com as notas e carga horarias
    @curso.each do |k, v|
      Curso.new(k, v).exibe_cr
    end
    puts "* * * * * *"
    puts "Média de CR dos cursos"
    puts "Cur --- Média CR"
    puts ""
    FormatadorDados.new(@aluno, @matricula)
  end
  Inicializador.new
end