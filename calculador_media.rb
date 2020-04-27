

class CalculadorMedia
  def initialize(hash)
    @hash = hash
    calcula_media
  end

  def calcula_media
    array = []
    @hash.each do |d, l|
      l.each do |e|
        array << e[0].values[1]
      end
      denominador = array.length
      numerador = array.sum
      puts "#{d.values[0]} --- #{numerador/denominador}"
      array = []
    end
  end
end