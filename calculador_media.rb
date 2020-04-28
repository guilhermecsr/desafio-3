#classe para calcular a media dos CRs dos cursos
class CalculadorMedia
  #hash eh um hash com chaves cod curso e valores matricula e CRs dos alunos
  #hash: {{[:cod_curso]=>"4"}=> [[{[:matricula]=>"100", [:cr]=>63}], ..., [{[:matricula]=>"116", [:cr]=>59}]], {[:cod_curso]=>"56"}=> [[{[:matricula]=>"100", [:cr]=>63}], ..., [{[:matricula]=>"116", [:cr]=>59}]]}
  def initialize(hash)
    @hash = hash
    calcula_media
  end
#metodo que calcula a media e imprime os valores
  def calcula_media
    array = []
    @hash.each do |curso, crs|
      crs.each do |cr|
        array << cr[0].values[1]
      end
      denominador = array.length
      numerador = array.sum
      puts "#{curso.values[0]} --- #{numerador/denominador}"
      array = []
    end
  end
end