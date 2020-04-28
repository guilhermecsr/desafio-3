require_relative 'aluno'
require_relative 'curso'
require 'csv'
require_relative 'calculador_media'
#classe para formatar os dados dos alunos e dos cursos
class FormatadorDados
  def initialize(dados_aluno, dados_cursos_matricula)
    @dados_aluno = dados_aluno
    @dados_cursos_matricula = dados_cursos_matricula
    reune_dados
  end
#metodo para reunir os dados dos alunos e cursos nos respectivos arrays crs e cursos
# em crs temos um array com as matriculas dos alunos e os seus devidos CRs
# em cursos temos um array com os cod cursos e as matriculas dos devidos alunos
  def reune_dados
    crs = []
    @dados_aluno.each do |k, v|
      crs << (Aluno.new(k, v).retorna_dados)
    end
    cursos = []
    @dados_cursos_matricula.each do |k, v|
      #usei o flatten e o uniq para remover as matriculas repetidas para que cada CR fosse unico
      cursos << (Curso.new(k, v.flatten.uniq).retorna_dados)
    end
    formata_dados(crs, cursos)
  end

#crs: [{{:matricula=>"100"}=>63}, ..., {{:matricula=>"116"}=>59}]
#cursos: [{{:cod_curso=>"4"}=> ["100", ..., "116"]}, ..., {{:cod_curso=>"56"}=> ["100", ..., "116"]}]
  def formata_dados(crs, cursos)
    hash = {}
    cursos.each do |curso|
      curso.values[0].each do |matricula|
        crs.each do |cr|
          #aqui temos uma condicao que garante que os crs serao adicionados nas respectivas matriculas
          if matricula == cr.keys[0].values[0]
            if hash[[:cod_curso] => curso.keys[0].values[0]]
              hash[[:cod_curso] => curso.keys[0].values[0]] << [[:matricula] => matricula, [:cr] => cr.values[0]]
            else
              hash[[:cod_curso] => curso.keys[0].values[0]] = [[[:matricula] => matricula, [:cr] => cr.values[0]]]
            end
          end
        end
      end
    end
    CalculadorMedia.new(hash)
  end
end