# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating fake user..."
User.destroy_all
user = User.create!(
  email: "Léo@gmail.com",
  password: "leorok",
  password_confirmation: "leorok"
)
puts "Fake user created:"
puts "#{user.email} / leorok"

puts "Cleaning database..."
Badge.destroy_all
Goal.destroy_all
Category.destroy_all
puts "Creating categories, goals and funky badges..."
categories = {
  # ---------------------------------------------------------
  #                      VOYAGES
  # ---------------------------------------------------------
  "Voyages" => {
    "Voir les 7 merveilles du monde" => [
      { title: "Explorateur du dimanche", description: "Repérer les 7 merveilles sur une carte" },
      { title: "Voyageur en préchauffage", description: "Planifier la visite d’une première merveille" },
      { title: "Aventurier certifié", description: "Visiter une première merveille" },
      { title: "Touriste professionnel", description: "Visiter trois merveilles différentes" },
      { title: "Légende des 7 merveilles", description: "Compléter le tour des 7 merveilles" }
    ],
    "Visiter 10 capitales" => [
      { title: "Citadin débutant", description: "Découvrir la capitale de son pays" },
      { title: "Globe-trotteur européen", description: "Visiter une capitale européenne" },
      { title: "Voyageur intercontinental", description: "Visiter une capitale hors de son continent" },
      { title: "Collectionneur de capitales", description: "Visiter cinq capitales" },
      { title: "Maître des métropoles", description: "Visiter dix capitales" }
    ],
    "Faire un trek emblématique" => [
      { title: "Marcheur du lundi", description: "Faire une randonnée de 5 km" },
      { title: "Pote de la pente", description: "Faire une randonnée de 10 km" },
      { title: "Chevalier du dénivelé", description: "Faire une randonnée de 20 km" },
      { title: "Survivant du weekend", description: "Faire une randonnée sur 2 jours" },
      { title: "Maître du trek ultime", description: "Accomplir un trek emblématique" }
    ],
    "Apprendre le japonais" => [
      { title: "Senpai de poche", description: "Apprendre 20 mots" },
      { title: "Maître des hiragana hésitants", description: "Apprendre 100 mots" },
      { title: "Samouraï du small talk", description: "Tenir une conversation simple" },
      { title: "Ronin de la lecture", description: "Comprendre un texte court" },
      { title: "Sensei du japonais", description: "Tenir une conversation fluide" }
    ],
    "Participer à 5 festivals dans le monde" => [
      { title: "Festivaleux local", description: "Participer à un festival près de chez soi" },
      { title: "Festival-hopper européen", description: "Participer à un festival dans un autre pays" },
      { title: "Globe-raveur culturel", description: "Participer à un festival culturel" },
      { title: "Danseur des continents", description: "Participer à un festival hors continent" },
      { title: "Dieu des festivals", description: "Participer à 5 festivals dans le monde" }
    ]
  },
  # ---------------------------------------------------------
  #                    MUSIQUE
  # ---------------------------------------------------------
  "Musique" => {
    "Apprendre la guitare" => [
      { title: "Gratteur de canapé", description: "Apprendre 3 accords de base" },
      { title: "Rockeur en initiation", description: "Jouer un morceau simple" },
      { title: "Maître des changements d’accords", description: "Changer d’accords fluidement" },
      { title: "Guitariste presque pro", description: "Jouer un morceau complet avec rythme" },
      { title: "Légende du manche", description: "Jouer 5 morceaux variés" }
    ],
    "Apprendre le piano" => [
      { title: "Pianiste du dimanche", description: "Apprendre les notes" },
      { title: "Maestro de la main droite", description: "Jouer un enchaînement simple" },
      { title: "Créature à deux mains", description: "Jouer un morceau à deux mains" },
      { title: "Virtuose en rodage", description: "Jouer un morceau intermédiaire" },
      { title: "Mozart de quartier", description: "Jouer 5 morceaux complets" }
    ],
    "Apprendre à chanter" => [
      { title: "Rossignol rouillé", description: "Faire un exercice vocal" },
      { title: "Maître du tempo", description: "Chanter en rythme" },
      { title: "Chanteur juste (miracle!)", description: "Chanter une chanson juste" },
      { title: "Star de salle de bain", description: "Enregistrer une performance" },
      { title: "Diva devant public", description: "Chanter devant quelqu’un" }
    ],
    "Élargir son répertoire musical" => [
      { title: "Explorateur Spotify", description: "Découvrir 5 nouveaux artistes" },
      { title: "Globe-auditeur", description: "Écouter 5 genres différents" },
      { title: "DJ sélecteur", description: "Créer une playlist de 30 titres" },
      { title: "Chasseur de vibes", description: "Assister à un événement musical" },
      { title: "Encyclopédie vivante du son", description: "Découvrir 50 artistes" }
    ],
    "Aller à 5 concerts dans l’année" => [
      { title: "Spectateur débutant", description: "Aller à un concert local" },
      { title: "Fan dévoué", description: "Aller à un concert d’un artiste qu’on suit" },
      { title: "Aventurier des grandes salles", description: "Aller à un grand concert/festival" },
      { title: "Nomade musical", description: "Aller à un concert dans une autre ville" },
      { title: "Machine à concerts", description: "Aller à 5 concerts dans l’année" }
    ]
  },
  # ---------------------------------------------------------
  #                    SPORT
  # ---------------------------------------------------------
  "Sport" => {
    "10 000 pas par jour" => [
      { title: "Marcheur du quartier", description: "Faire 3 000 pas" },
      { title: "Piéton motivé", description: "Faire 5 000 pas" },
      { title: "Explorateur urbain", description: "Faire 7 000 pas" },
      { title: "Randonneur pressé", description: "Faire 10 000 pas une fois" },
      { title: "Marcheur légendaire", description: "Faire 10 000 pas pendant 7 jours" }
    ],
    "Faire 50 pompes" => [
      { title: "Bodybuilder en herbe", description: "Faire 5 pompes" },
      { title: "Machine à pompes niveau 1", description: "Faire 10 pompes" },
      { title: "Mestre du push-up", description: "Faire 20 pompes" },
      { title: "Bras de titan", description: "Faire 35 pompes" },
      { title: "Légende des pompes", description: "Faire 50 pompes" }
    ],
    "Élargir son catalogue sportif" => [
      { title: "Curieux sportif", description: "Rechercher des sports" },
      { title: "Testeur en série", description: "Essayer 1 sport" },
      { title: "Poly-athlète débutant", description: "Essayer 3 sports" },
      { title: "Sportif touche-à-tout", description: "Essayer 5 sports" },
      { title: "Sportif métamorphe", description: "Pratiquer régulièrement un nouveau sport" }
    ],
    "Participer à une compétition sportive" => [
      { title: "Ambitieux motivé", description: "Choisir une compétition" },
      { title: "Entraîné (un peu)", description: "Faire un entraînement préparatoire" },
      { title: "Finisher officiel", description: "Terminer une compétition locale" },
      { title: "Podium potentiel", description: "Se classer dans une compétition" },
      { title: "Champion de légende", description: "Participer à une compétition régionale" }
    ],
    "Apprendre à danser" => [
      { title: "Danseur articulé (presque)", description: "Apprendre 3 pas de base" },
      { title: "Maestro du move", description: "Apprendre une chorégraphie simple" },
      { title: "Danseur en rythme", description: "Danser une musique entière" },
      { title: "Prince/Princesse du dancefloor", description: "Participer à un cours de danse" },
      { title: "Dieu/Déesse de la danse", description: "Danser une chorégraphie devant des gens" }
    ]
  }
}

categories.each do |category_name, goals|
  category = Category.create!(name: category_name)
  goals.each do |goal_name, badges|
    goal = Goal.create!(name: goal_name, category: category)
    badges.each do |badge|
      Badge.create!(
        title: badge[:title],
        description: badge[:description],
        goal: goal
      )
    end
  end
end
puts "Seeds completed!"
