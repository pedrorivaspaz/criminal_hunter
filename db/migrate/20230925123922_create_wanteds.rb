class CreateWanteds < ActiveRecord::Migration[7.0]
  def change
    create_table :wanteds do |t|
      t.string :nome
      t.string :data_aniversario_usada
      t.string :cabelo
      t.string :olhos
      t.string :sexo
      t.string :peso
      t.string :altura
      t.string :raca
      t.string :nacionalidade
      t.string :crime
      t.string :url_foto
      t.string :origem

      t.timestamps
    end
  end
end
