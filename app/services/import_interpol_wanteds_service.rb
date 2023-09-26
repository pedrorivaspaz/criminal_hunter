class ImportInterpolWantedsService

  def self.execute
    page = 1
    while(true) do
      response = Faraday.get("https://ws-public.interpol.int/notices/v1/red?&resultPerPage=20&page=#{page}")
      break if page == 8
      data = JSON.parse(response.body)

      data['_embedded']['notices'].each do |item|
        link = item['_links']['self']['href']
        response = Faraday.get(link)
        xpto = JSON.parse(response.body)

        if item['_links'].key?('thumbnail')
          url_foto = item['_links']['thumbnail']['href']
        else
          url_foto = nil
        end

        Wanted.create(
          nome: "#{xpto['forename']} #{xpto['name']}",
          data_aniversario_usada: xpto['date_of_birth'],
          cabelo: xpto['hairs_id'],
          olhos: xpto['eyes_colors_id'],
          sexo: xpto['sex_id'],
          peso: xpto['weight'],
          altura: xpto['height'],
          raca: xpto['null'],
          nacionalidade: xpto['nationalities'],
          crime: xpto['arrest_warrants'][0]['charge'],
          url_foto: url_foto,
          origem: 'INTERPOL'
        )
      end
      page += 1
    end
  end
end
