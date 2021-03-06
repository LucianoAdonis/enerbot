# Module dedicated to Security
module Pedro
  def self.engel(data)
    require 'json'
    require 'net/http'

    option = data.text.split[2]
    signos = %w[aries
                tauro
                geminis
                cancer
                leo
                virgo
                libra
                escorpion
                sagitario
                capricornio
                acuario
                piscis]
    if signos.include? option
      api = JSON.parse(Net::HTTP.get(URI('https://api.adderou.cl/tyaas/')))
      signo = api['horoscopo'][option]
      <<~HEREDOC
      Horóscopo para *#{option}* hoy: #{Date.today}
      :heart:*Amor:* #{signo['amor']}
      :medical_symbol:*Salud:* #{signo['salud']}
      :moneybag:*Dinero:* #{signo['dinero']}
      :art:*Color:* #{signo['color']}
      :8ball:*Número:* #{signo['numero']}
      HEREDOC
    else
      if 'ofiuco' == option
        ':enerfiuco:'
      else
        "[WARN] No es canon #{option}"
      end
    end
  end
end
