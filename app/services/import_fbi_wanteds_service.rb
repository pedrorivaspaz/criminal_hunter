class ImportFbiWantedsService

  def self.execute
    page = 1
    while(true) do
      response = Faraday.get("https://api.fbi.gov/@wanted?page=#{page}")
      break if response.status != 200
      data = JSON.parse(response.body)

      data['items'].each do |item|
        Wanted.create(
          nome: item['title'],
          data_aniversario_usada: item['dates_of_birth_used'],
          cabelo: item['hair'],
          olhos: item['eyes'],
          sexo: item['sex'],
          peso: item['weight'],
          altura: item['height'],
          raca: item['race'],
          nacionalidade: item['nationality'],
          crime: item['description'],
          url_foto: item['images'][0]['original'],
          origem: 'FBI'
        )
      end
      page += 1
    end
  end
end
