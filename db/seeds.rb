# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating or finding fake user..."

email = "leo@gmail.com"

user = User.find_by(email: email)

unless user
  user = User.create!(
    email: email,
    password: "leorok",
    password_confirmation: "leorok"
  )
end

puts "Fake user ready: #{user.email} / leorok"

puts "Adding new categories, goals and badges..."

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
  },
  # ---------------------------------------------------------
  #                    Cuisine
  # ---------------------------------------------------------
  "Cuisine" => {
    "Maîtriser la cuisine italienne" => [
    { title: "Novice en pâtes", description: "Faire ses premières pâtes maison" },
    { title: "Chef en herbe", description: "Préparer une pizza complète" },
    { title: "Maestro du risotto", description: "Réaliser un risotto parfait" },
    { title: "Virtuose italien", description: "Préparer un repas complet" },
    { title: "Chef étoilé local", description: "Organiser un dîner italien" }
    ],
    "Découvrir la pâtisserie française" => [
    { title: "Apprenti pâtissier", description: "Réaliser un gâteau simple" },
    { title: "Boulanger du dimanche", description: "Faire un pain maison" },
    { title: "Chocolatier amateur", description: "Préparer des truffes" },
    { title: "Pâtissier confirmé", description: "Faire un entremet" },
    { title: "Maître pâtissier", description: "Réaliser un dessert gastronomique" }
    ],
    "Apprendre la cuisine asiatique" => [
    { title: "Sushi débutant", description: "Préparer un rouleau de sushi" },
    { title: "Chef du wok", description: "Faire un plat sauté équilibré" },
    { title: "Maestro du ramen", description: "Préparer un bol de ramen maison" },
    { title: "Chef exotique", description: "Faire un plat asiatique complet" },
    { title: "Virtuose culinaire", description: "Organiser un dîner asiatique" }
    ],
    "Maîtriser la cuisine végétarienne" => [
    { title: "Veggie novice", description: "Préparer un plat végétarien simple" },
    { title: "Explorateur veggie", description: "Créer un menu végétarien complet" },
    { title: "Cuisinier sain", description: "Préparer 3 recettes équilibrées" },
    { title: "Gourmet végétarien", description: "Organiser un dîner végétarien" },
    { title: "Maître veggie", description: "Innover 5 nouvelles recettes végétariennes" }
    ],
    "Cuisiner avec un budget limité" => [
    { title: "Économe débutant", description: "Préparer un repas pour moins de 5€" },
    { title: "Astucieux cuisinier", description: "Faire 3 repas économiques" },
    { title: "Chef malin", description: "Créer un menu complet à petit prix" },
    { title: "Maître du budget", description: "Préparer 5 plats créatifs à petit coût" },
    { title: "Gourmet malin", description: "Faire un dîner complet pour 2 à moins de 10€" }
    ],
    "Apprendre à cuisiner des desserts internationaux" => [
    { title: "Dessert novice", description: "Faire un dessert simple" },
    { title: "Explorateur sucré", description: "Préparer un dessert européen" },
    { title: "Chef sucré", description: "Réaliser un dessert asiatique" },
    { title: "Virtuose gourmand", description: "Préparer un dessert exotique" },
    { title: "Maître pâtissier international", description: "Faire un dessert de 3 pays différents" }
    ],
    "Cuisiner pour des événements spéciaux" => [
    { title: "Petit chef", description: "Préparer un plat pour un anniversaire" },
    { title: "Cuisinier festif", description: "Faire un repas pour un dîner" },
    { title: "Chef de fête", description: "Organiser un repas pour 5 personnes" },
    { title: "Maestro de l'événement", description: "Créer un menu thématique" },
    { title: "Virtuose culinaire", description: "Préparer un banquet pour 10 personnes" }
    ],
    "Maîtriser les sauces et condiments" => [
    { title: "Saucier débutant", description: "Faire une sauce simple" },
    { title: "Chef assaisonneur", description: "Préparer 3 sauces maison" },
    { title: "Maestro du goût", description: "Réaliser un repas complet avec sauces" },
    { title: "Expert en condiments", description: "Créer 5 sauces originales" },
    { title: "Maître des saveurs", description: "Inventer un nouveau condiment" }
    ],
    "Cuisiner pour la santé" => [
    { title: "Débutant équilibré", description: "Préparer un plat équilibré" },
    { title: "Cuisinier santé", description: "Faire 3 repas sains" },
    { title: "Chef nutritif", description: "Créer un menu pour une semaine" },
    { title: "Maître bien-être", description: "Organiser un dîner santé complet" },
    { title: "Virtuose de la nutrition", description: "Innover 5 recettes saines" }
    ],
    "Maîtriser la cuisine rapide" => [
    { title: "Rapide débutant", description: "Faire un repas en 15 minutes" },
    { title: "Chef express", description: "Préparer un repas en 30 minutes" },
    { title: "Maestro du timing", description: "Faire 3 plats rapides" },
    { title: "Virtuose rapide", description: "Créer un menu complet en 1h" },
    { title: "Champion de la rapidité", description: "Organiser un dîner complet en moins d'1h30" }
    ]
  },
  # ---------------------------------------------------------
  #                    Sommeil
  # ---------------------------------------------------------
  "Sommeil" => {
    "Atteindre les rêves lucides" => [
      { title: "Passeur de seuil", description: "Tenir un journal de rêves 3 jours" },
      { title: "Ancre de réalité", description: "Faire des tests de réalité en journée" },
      { title: "Mémoire onirique", description: "Se souvenir de 2 rêves distincts" },
      { title: "Conscience émergente", description: "Réaliser que l’on rêve" },
      { title: "Architecte du rêve", description: "Contrôler un élément du rêve" }
    ],

    "Améliorer la qualité du sommeil" => [
      { title: "Rituel du crépuscule", description: "Créer une routine avant de dormir" },
      { title: "Nuit sans écran", description: "Éviter les écrans avant le coucher" },
      { title: "Dormeur profond", description: "Dormir sans réveil nocturne" },
      { title: "Cycle maîtrisé", description: "Se réveiller reposé 3 jours d’affilée" },
      { title: "Sommeil royal", description: "Atteindre un sommeil réparateur constant" }
    ],

    "S’endormir plus rapidement" => [
      { title: "Esprit calme", description: "Tester une technique de relaxation" },
      { title: "Respiration contrôlée", description: "Faire une respiration guidée" },
      { title: "Endormissement express", description: "S’endormir en moins de 30 min" },
      { title: "Horloge interne", description: "S’endormir à heure fixe 3 jours" },
      { title: "Maître du lâcher-prise", description: "S’endormir rapidement sans effort" }
    ],

    "Créer une routine de coucher stable" => [
      { title: "Première habitude", description: "Choisir une action répétée le soir" },
      { title: "Répétition nocturne", description: "Suivre la routine 3 soirs" },
      { title: "Discipline douce", description: "Tenir la routine 7 jours" },
      { title: "Automatisme", description: "Routine sans y penser" },
      { title: "Gardien du sommeil", description: "Routine ancrée sur le long terme" }
    ],

    "Se réveiller en forme" => [
      { title: "Réveil sans violence", description: "Se lever sans snooze" },
      { title: "Matin clair", description: "Se lever reposé une fois" },
      { title: "Stabilité matinale", description: "Se lever à heure fixe 3 jours" },
      { title: "Énergie matinale", description: "Commencer la journée motivé" },
      { title: "Réveil de légende", description: "Matins énergiques toute la semaine" }
    ],

    "Réduire les réveils nocturnes" => [
      { title: "Observation nocturne", description: "Identifier la cause des réveils" },
      { title: "Nuit plus stable", description: "Réduire les réveils une nuit" },
      { title: "Sommeil continu", description: "Dormir avec peu d’interruptions" },
      { title: "Nuit fluide", description: "Dormir sans réveil notable" },
      { title: "Silence intérieur", description: "Sommeil profond constant" }
    ],

    "Optimiser son environnement de sommeil" => [
      { title: "Chambre rangée", description: "Rendre la chambre propice au sommeil" },
      { title: "Obscurité totale", description: "Dormir dans le noir complet" },
      { title: "Silence nocturne", description: "Limiter les bruits parasites" },
      { title: "Température idéale", description: "Optimiser la température" },
      { title: "Sanctuaire du sommeil", description: "Créer un environnement parfait" }
    ],

    "Dormir sans stress" => [
      { title: "Décharge mentale", description: "Noter ses pensées avant dormir" },
      { title: "Esprit apaisé", description: "Se coucher sans anxiété" },
      { title: "Nuit légère", description: "Dormir sans rumination" },
      { title: "Lâcher total", description: "S’endormir sereinement" },
      { title: "Paix nocturne", description: "Dormir profondément sans stress" }
    ],

    "Allonger la durée de sommeil" => [
      { title: "Coucher avancé", description: "Se coucher plus tôt une fois" },
      { title: "Nuit complète", description: "Dormir 7h une nuit" },
      { title: "Rythme étendu", description: "Dormir 7h sur 3 jours" },
      { title: "Sommeil durable", description: "Dormir suffisamment toute la semaine" },
      { title: "Repos absolu", description: "Durée idéale maintenue" }
    ],

    "Maîtriser son rythme circadien" => [
      { title: "Horloge consciente", description: "Observer ses heures naturelles" },
      { title: "Stabilité nocturne", description: "Heures régulières 3 jours" },
      { title: "Synchronisation", description: "Rythme stable une semaine" },
      { title: "Corps aligné", description: "Sommeil et réveil naturels" },
      { title: "Maître du temps", description: "Rythme circadien parfaitement aligné" }
    ]
  },
  # ---------------------------------------------------------
  #                    Divertissement
  # ---------------------------------------------------------
  "Divertissement" => {
    "Regarder 10 films cultes" => [
      { title: "Cinéphile débutant", description: "Regarder ton premier film culte" },
      { title: "Spectateur aguerri", description: "En regarder 3 de plus" },
      { title: "Marathonien du cinéma", description: "Voir 5 films cultes" },
      { title: "Critique éclairé", description: "Voir 8 films cultes" },
      { title: "Maître du grand écran", description: "Voir les 10 films" }
    ],
    "Terminer 5 jeux vidéo" => [
      { title: "Joueur novice", description: "Finir ton premier jeu" },
      { title: "Gamer appliqué", description: "En finir un deuxième" },
      { title: "Challengeur", description: "Terminer 3 jeux" },
      { title: "Pro du joystick", description: "Finir 4 jeux" },
      { title: "Légende du gaming", description: "Terminer les 5" }
    ],
    "Lire 5 livres différents" => [
      { title: "Lecteur débutant", description: "Finir un livre" },
      { title: "Amateur éclairé", description: "Lire un deuxième livre" },
      { title: "Curieux insatiable", description: "Lire 3 livres" },
      { title: "Bibliophile", description: "Lire 4 livres" },
      { title: "Erudit", description: "Lire 5 livres" }
    ],
    "Regarder 10 séries" => [
      { title: "Sériephile débutant", description: "Regarder ta première série" },
      { title: "Fan assidu", description: "Regarder 3 séries" },
      { title: "Addict confirmé", description: "Voir 5 séries" },
      { title: "Marathonien du canapé", description: "Regarder 8 séries" },
      { title: "Sériphile ultime", description: "Voir les 10 séries" }
    ],
    "Résoudre un Rubik’s Cube" => [
      { title: "Novice du cube", description: "Résoudre une face" },
      { title: "Apprenti cuber", description: "Résoudre deux faces" },
      { title: "Cubiste confirmé", description: "Résoudre trois faces" },
      { title: "Maître du cube", description: "Résoudre la moitié du cube" },
      { title: "Grand maître du Rubik’s Cube", description: "Résoudre complètement le cube" }
    ],
    "Découvrir des animes" => [
      { title: "Otaku en herbe", description: "Découvrir ton premier anime" },
      { title: "Curieux animé", description: "Regarder 2 animes" },
      { title: "Explorateur animé", description: "Regarder 3 animes" },
      { title: "Fan éclairé", description: "Regarder 4 animes" },
      { title: "Maître otaku", description: "Regarder 5 animes" }
    ],
    "Créer ton top 10 films" => [
      { title: "Critique amateur", description: "Lister tes 3 films préférés" },
      { title: "Sélecteur averti", description: "Compléter 5 films" },
      { title: "Curateur", description: "Atteindre 7 films" },
      { title: "Expert cinéphile", description: "Lister 9 films" },
      { title: "Maître du top 10", description: "Compléter le top 10" }
    ],
    "Créer ton top 10 jeux vidéo" => [
      { title: "Gamer débutant", description: "Lister tes 3 jeux préférés" },
      { title: "Fan sélectif", description: "Atteindre 5 jeux" },
      { title: "Collectionneur", description: "Lister 7 jeux" },
      { title: "Pro gamer", description: "Atteindre 9 jeux" },
      { title: "Maître du top 10", description: "Compléter le top 10" }
    ],
    "Créer ton top 10 livres" => [
      { title: "Lecteur débutant", description: "Lister 3 livres" },
      { title: "Lecteur passionné", description: "Atteindre 5 livres" },
      { title: "Bibliophile averti", description: "Lister 7 livres" },
      { title: "Erudit", description: "Lister 9 livres" },
      { title: "Maître des pages", description: "Compléter le top 10" }
    ],
    "Tester 5 activités fun inédites" => [
      { title: "Découvreur", description: "Essayer une nouvelle activité" },
      { title: "Aventurier", description: "Tester 2 activités" },
      { title: "Explorateur", description: "Tester 3 activités" },
      { title: "Fun addict", description: "Tester 4 activités" },
      { title: "Maître du divertissement", description: "Tester les 5 activités" }
    ]
  },
  # ---------------------------------------------------------
  #                    Divertissement
  # ---------------------------------------------------------
  "Créatif" => {
    "Peindre un tableau" => [
      { title: "Pinceau débutant", description: "Faire ton premier dessin au crayon" },
      { title: "Artiste en herbe", description: "Peindre une petite toile" },
      { title: "Peintre confirmé", description: "Terminer une toile de taille moyenne" },
      { title: "Maestro des couleurs", description: "Peindre une grande toile complexe" },
      { title: "Grand maître peintre", description: "Créer une œuvre digne d’exposition" }
    ],
    "Réaliser un dessin quotidien" => [
      { title: "Gribouilleur", description: "Faire un petit dessin" },
      { title: "Dessinateur motivé", description: "Faire 3 dessins en une semaine" },
      { title: "Artiste appliqué", description: "Faire 5 dessins en une semaine" },
      { title: "Illustrateur régulier", description: "Faire 7 dessins" },
      { title: "Maître du carnet", description: "Maintenir 30 jours de dessins consécutifs" }
    ],
    "Sculpter une création" => [
      { title: "Sculpteur novice", description: "Réaliser une petite sculpture en pâte à modeler" },
      { title: "Sculpteur appliqué", description: "Faire une sculpture en argile" },
      { title: "Sculpteur confirmé", description: "Créer une sculpture complexe" },
      { title: "Maestro de la matière", description: "Terminer une sculpture détaillée" },
      { title: "Grand sculpteur", description: "Créer une œuvre exposable" }
    ],
    "Participer à un challenge artistique" => [
      { title: "Débutant créatif", description: "Participer à ton premier challenge" },
      { title: "Challenger régulier", description: "Participer à 3 challenges" },
      { title: "Expert créatif", description: "Participer à 5 challenges" },
      { title: "Maestro des défis", description: "Participer à 7 challenges" },
      { title: "Champion artistique", description: "Participer à 10 challenges" }
    ],
    "Expérimenter 3 techniques artistiques différentes" => [
      { title: "Curieux artistique", description: "Essayer une nouvelle technique" },
      { title: "Explorateur des médiums", description: "Essayer 2 techniques" },
      { title: "Polytechnique créatif", description: "Essayer 3 techniques" },
      { title: "Maître des techniques", description: "Maîtriser 3 techniques" },
      { title: "Virtuose des arts", description: "Maîtriser 5 techniques différentes" }
    ],
    "Créer un objet DIY" => [
      { title: "Brico débutant", description: "Réaliser un objet simple" },
      { title: "Bricoleur motivé", description: "Faire 2 objets DIY" },
      { title: "Créateur habile", description: "Réaliser un objet original" },
      { title: "Artisan confirmé", description: "Créer un objet complexe" },
      { title: "Maître bricoleur", description: "Réaliser une série d’objets originaux" }
    ],
    "Coudre un accessoire" => [
      { title: "Fil débutant", description: "Coudre un petit accessoire" },
      { title: "Apprenti couturier", description: "Faire un objet textile simple" },
      { title: "Couturier appliqué", description: "Créer un accessoire complexe" },
      { title: "Maestro du fil", description: "Réaliser une pièce unique" },
      { title: "Grand couturier", description: "Créer une collection complète" }
    ],
    "Fabriquer un bijou" => [
      { title: "Bijoutier novice", description: "Créer un simple bracelet" },
      { title: "Bijoutier créatif", description: "Réaliser un collier simple" },
      { title: "Artisan bijoutier", description: "Créer un ensemble de bijoux" },
      { title: "Maestro des gemmes", description: "Fabriquer un bijou complexe" },
      { title: "Grand bijoutier", description: "Créer une collection complète de bijoux" }
    ],
    "Décorer une pièce" => [
      { title: "Déco débutant", description: "Ranger et décorer un coin de ta chambre" },
      { title: "Décorateur motivé", description: "Réaménager une pièce" },
      { title: "Artiste décorateur", description: "Créer une décoration originale" },
      { title: "Maestro de la déco", description: "Refaire une pièce entière avec style" },
      { title: "Grand décorateur", description: "Créer un espace digne d’un magazine" }
    ],
    "Photographier et retoucher" => [
      { title: "Apprenti photographe", description: "Prendre une photo correcte" },
      { title: "Photographe amateur", description: "Faire 5 belles photos" },
      { title: "Photographe créatif", description: "Réaliser un petit projet photo" },
      { title: "Maestro de la lumière", description: "Créer une série photographique originale" },
      { title: "Photographe pro", description: "Produire une galerie complète et cohérente" }
    ]
  },
  # ---------------------------------------------------------
  #                    Santé
  # ---------------------------------------------------------
  "Santé" => {
    "Boire 2 litres d'eau par jour" => [
      { title: "Gouttelette", description: "Boire 0,5 litre d'eau" },
      { title: "Hydraté", description: "Boire 1 litre d'eau" },
      { title: "Héros hydraté", description: "Boire 1,5 litre d'eau" },
      { title: "Maître de l'eau", description: "Boire 2 litres d'eau une journée" },
      { title: "Hydromancien", description: "Boire 2 litres d'eau pendant une semaine" }
    ],
    "Manger équilibré pendant une semaine" => [
      { title: "Débutant veggie", description: "Ajouter 1 fruit ou légume par jour" },
      { title: "Assidu", description: "Manger équilibré 3 jours de suite" },
      { title: "Rigoureux", description: "Manger équilibré 5 jours de suite" },
      { title: "Maître nutrition", description: "Manger équilibré 7 jours de suite" },
      { title: "Gourmet expert", description: "Maintenir une alimentation équilibrée pendant 2 semaines" }
    ],
    "Dormir 7-8 heures par nuit" => [
      { title: "Sommeil ponctuel", description: "Dormir 6 heures une nuit" },
      { title: "Dormeur régulier", description: "Dormir 7 heures deux nuits de suite" },
      { title: "Maître du repos", description: "Dormir 7-8 heures pendant 3 nuits" },
      { title: "Expert du sommeil", description: "Maintenir 7-8 heures pendant 1 semaine" },
      { title: "Sommeil parfait", description: "Maintenir 7-8 heures pendant 1 mois" }
    ],
    "Marcher 10 000 pas par jour" => [
      { title: "Pas motivé", description: "Faire 2 000 pas" },
      { title: "Promeneur", description: "Faire 5 000 pas" },
      { title: "Marcheur actif", description: "Faire 7 500 pas" },
      { title: "Marcheur confirmé", description: "Faire 10 000 pas" },
      { title: "Roi/Roi des pas", description: "Maintenir 10 000 pas pendant une semaine" }
    ],
    "Faire du sport 3 fois par semaine" => [
      { title: "Sportif du dimanche", description: "Faire une séance" },
      { title: "Motivé", description: "Faire deux séances" },
      { title: "Assidu", description: "Faire trois séances" },
      { title: "Maître du rythme", description: "Faire trois séances pendant deux semaines" },
      { title: "Athlète confirmé", description: "Faire trois séances pendant un mois" }
    ],
    "Réduire le sucre" => [
      { title: "Petit sucre", description: "Éviter les boissons sucrées une journée" },
      { title: "Maîtrise douce", description: "Éviter sucre ajouté 3 jours" },
      { title: "Expert en sucre", description: "Éviter sucre ajouté 1 semaine" },
      { title: "Virtuose du sucre", description: "Réduire sucre ajouté pendant 2 semaines" },
      { title: "Maître du sucre", description: "Maintenir une alimentation faible en sucre pendant 1 mois" }
    ],
    "Méditer ou respirer 5 min par jour" => [
      { title: "Débutant zen", description: "Faire 1 séance de 2 min" },
      { title: "Relaxé", description: "Faire 3 séances de 5 min" },
      { title: "Concentré", description: "Faire 5 séances de 5 min" },
      { title: "Maître zen", description: "Faire 10 séances" },
      { title: "Sage", description: "Maintenir la pratique quotidienne pendant 1 mois" }
    ],
    "Limiter écran avant le coucher" => [
      { title: "Débutant digital", description: "Éteindre l'écran 15 min avant de dormir" },
      { title: "Assidu", description: "Éteindre 30 min avant le coucher" },
      { title: "Régulier", description: "Éteindre 1 h avant le coucher" },
      { title: "Expert nocturne", description: "Éteindre 1 h avant le coucher pendant 1 semaine" },
      { title: "Maître de la nuit", description: "Éteindre 1 h avant le coucher pendant 1 mois" }
    ],
    "Faire un check-up santé" => [
      { title: "Débutant prévoyant", description: "Prendre rendez-vous pour un check-up" },
      { title: "Assidu", description: "Passer un check-up de base" },
      { title: "Rigoureux", description: "Compléter les tests recommandés" },
      { title: "Maître santé", description: "Analyser les résultats et agir" },
      { title: "Santé parfaite", description: "Suivre toutes les recommandations et vérifier les progrès" }
    ],
    "Réduire stress et anxiété" => [
      { title: "Débutant zen", description: "Prendre 5 min pour respirer" },
      { title: "Calme", description: "Faire 10 min de relaxation" },
      { title: "Sérénité", description: "Faire 15 min de méditation ou activité relaxante" },
      { title: "Maître du calme", description: "Intégrer une routine anti-stress quotidienne" },
      { title: "Zen ultime", description: "Maintenir une vie équilibrée et gérer le stress efficacement" }
    ]
  }
}

categories.each do |category_name, goals|
  category = Category.find_or_create_by!(name: category_name)

  goals.each do |goal_name, badges|
    goal = Goal.find_or_create_by!(name: goal_name, category: category)

    badges.each do |badge|
      Badge.find_or_create_by!(title: badge[:title], goal: goal) do |b|
        b.description = badge[:description]
      end
    end
  end
end
puts "Seeds completed!"
