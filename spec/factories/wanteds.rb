FactoryBot.define do 
  factory :wanted do
    nome { "Alexsandro Perreira da Silva" }
    data_aniversario_usada { "12/09/2001"}
    cabelo {"black"}
    olhos {"black"}
    sexo {"Male"}
    peso { "89 Kg" }
    raca { "Asian"}
    nacionalidade {"Brazilian"}
    crime {"Murder"}
    url_foto {"https://ws-public.interpol.int/notices/v1/red/2023-61947/images"}
    origem {"FBI"}
  end
end

