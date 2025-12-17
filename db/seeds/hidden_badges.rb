# Trophées cachés fun/décalés - 3 par objectif
# Ces trophées ne comptent pas dans la progression et sont visibles uniquement si l'objectif est complété

puts "Creating hidden badges..."

HIDDEN_BADGES = {
  # VOYAGES
  "Voir les 7 merveilles du monde" => [
    { title: "Indiana Jones du dimanche", description: "Trouver un artefact ancien (ou une pièce de 10 centimes)" },
    { title: "VIP des pyramides", description: "Se faire offrir un thé par un local" },
    { title: "Maître du jet lag", description: "Visiter 3 fuseaux horaires en 48h sans s'endormir" }
  ],
  "Visiter 10 capitales" => [
    { title: "Collectionneur de tampons", description: "Avoir un passeport illisible tellement il est tamponné" },
    { title: "Polyglotte accidentel", description: "Commander un plat sans savoir ce que c'est" },
    { title: "Ambassadeur autoproclamé", description: "Se faire inviter à dîner par une famille locale" }
  ],
  "Faire un trek emblématique" => [
    { title: "Survivant des ampoules", description: "Finir un trek avec plus de pansements que d'orteils" },
    { title: "Chamois des Alpes", description: "Doubler un groupe de randonneurs en chantant" },
    { title: "Ermite moderne", description: "Passer 48h sans réseau et survivre" }
  ],
  "Apprendre le japonais" => [
    { title: "Otaku officiel", description: "Comprendre un anime sans sous-titres" },
    { title: "Maître du karaoké", description: "Chanter une chanson japonaise en entier" },
    { title: "Samouraï linguistique", description: "Faire rire un Japonais avec un jeu de mots" }
  ],
  "Participer à 5 festivals dans le monde" => [
    { title: "Roi/Reine du camping", description: "Dormir dans une tente sous la pluie et kiffer" },
    { title: "Danseur cosmique", description: "Danser 6h d'affilée sans pause pipi" },
    { title: "Légende du bracelet", description: "Garder un bracelet de festival plus d'un an" }
  ],

  # MUSIQUE
  "Apprendre la guitare" => [
    { title: "Groupie de luxe", description: "Recevoir un médiator de son guitariste favori" },
    { title: "Légende du rock", description: "Intégrer le groupe Metallica" },
    { title: "Star internationale", description: "Remplir le Stade de France" }
  ],
  "Apprendre le piano" => [
    { title: "Fantôme de l'opéra", description: "Jouer du piano à minuit dans un lieu abandonné" },
    { title: "Mozart réincarné", description: "Composer un morceau qui fait pleurer quelqu'un" },
    { title: "Pianiste de bar", description: "Se faire payer en verres pour avoir joué" }
  ],
  "Apprendre à chanter" => [
    { title: "Star de la douche", description: "Faire applaudir ses voisins (involontairement)" },
    { title: "Diva du métro", description: "Chanter dans le métro et recevoir de l'argent" },
    { title: "Voix d'or", description: "Être repéré par un producteur (même amateur)" }
  ],
  "Élargir son répertoire musical" => [
    { title: "DJ improvisé", description: "Prendre le contrôle de la musique à une soirée" },
    { title: "Hipster musical", description: "Aimer un groupe avant qu'il soit mainstream" },
    { title: "Archéologue sonore", description: "Découvrir un album sorti avant ta naissance et l'adorer" }
  ],
  "Aller à 5 concerts dans l'année" => [
    { title: "Front row forever", description: "Être au premier rang d'un concert de + de 1000 personnes" },
    { title: "Backstage legend", description: "Rencontrer un artiste après le concert" },
    { title: "Moshpit survivor", description: "Survivre à un moshpit et en redemander" }
  ],

  # SPORT
  "10 000 pas par jour" => [
    { title: "Forrest Gump", description: "Marcher tellement que les gens te demandent si ça va" },
    { title: "Useur de semelles", description: "User une paire de chaussures en marchant" },
    { title: "GPS humain", description: "Retrouver ton chemin sans téléphone dans une ville inconnue" }
  ],
  "Faire 50 pompes" => [
    { title: "Bras de Popeye", description: "Que quelqu'un te demande si tu fais de la muscu" },
    { title: "Pompeur fou", description: "Faire des pompes dans un lieu insolite" },
    { title: "Challenge viral", description: "Poster une vidéo de pompes qui fait plus de 100 likes" }
  ],
  "Élargir son catalogue sportif" => [
    { title: "Touche-à-tout olympique", description: "Essayer un sport dont tu ne connaissais pas l'existence" },
    { title: "Sportif globe-trotteur", description: "Pratiquer un sport typique d'un autre pays" },
    { title: "Légende du vestiaire", description: "Être le plus nul et le plus motivé du cours" }
  ],
  "Participer à une compétition sportive" => [
    { title: "Photo finish", description: "Finir une course avec moins de 1 seconde d'écart" },
    { title: "Mascotte de l'équipe", description: "Recevoir un surnom de la part de tes coéquipiers" },
    { title: "Retour triomphant", description: "Participer après une blessure et finir" }
  ],
  "Apprendre à danser" => [
    { title: "Roi/Reine du dancefloor", description: "Que des inconnus te demandent de leur apprendre des pas" },
    { title: "Flash mob star", description: "Participer à un flash mob" },
    { title: "Danseur viral", description: "Apparaître dans une vidéo TikTok à ton insu" }
  ],

  # CUISINE
  "Maîtriser la cuisine italienne" => [
    { title: "Nonna approuvé", description: "Recevoir un compliment d'une vraie Nonna italienne" },
    { title: "Pizzaiolo de rue", description: "Faire tourner une pâte à pizza en l'air sans la faire tomber" },
    { title: "Parrain de la pasta", description: "Avoir sa propre recette secrète de sauce tomate" }
  ],
  "Découvrir la pâtisserie française" => [
    { title: "Croissant parfait", description: "Faire un croissant avec plus de 27 couches" },
    { title: "Chef étoilé clandestin", description: "Que quelqu'un te demande si tu es pâtissier pro" },
    { title: "Instagram food star", description: "Avoir une photo de gâteau avec plus de 500 likes" }
  ],
  "Apprendre la cuisine asiatique" => [
    { title: "Maître des baguettes", description: "Manger des nouilles sans en faire tomber une seule" },
    { title: "Ramen boss", description: "Faire un bouillon qui mijote plus de 12h" },
    { title: "Sushi sensei", description: "Faire un sushi que même un Japonais valide" }
  ],
  "Maîtriser la cuisine végétarienne" => [
    { title: "Convertisseur veggie", description: "Faire aimer un plat végé à un carnivore convaincu" },
    { title: "Alchimiste du tofu", description: "Rendre le tofu délicieux (exploit rare)" },
    { title: "Jardinier gourmet", description: "Cuisiner uniquement avec des légumes de ton jardin" }
  ],
  "Cuisiner avec un budget limité" => [
    { title: "Master radin gourmet", description: "Faire un repas gastronomique pour moins de 3€" },
    { title: "Roi des restes", description: "Créer un chef-d'œuvre avec les fonds de frigo" },
    { title: "Chasseur de promos", description: "Remplir un caddie en n'achetant que des promos" }
  ],
  "Apprendre à cuisiner des desserts internationaux" => [
    { title: "Tour du monde sucré", description: "Faire un dessert de chaque continent" },
    { title: "Ambassadeur gourmand", description: "Faire découvrir un dessert exotique à 10 personnes" },
    { title: "Fusion master", description: "Créer un dessert qui mélange deux cultures" }
  ],
  "Cuisiner pour des événements spéciaux" => [
    { title: "Traiteur improvisé", description: "Sauver un événement avec ta cuisine" },
    { title: "Chef de mariage", description: "Cuisiner pour un mariage (même petit)" },
    { title: "Légende des anniversaires", description: "Que quelqu'un demande TON gâteau pour son anniv" }
  ],
  "Maîtriser les sauces et condiments" => [
    { title: "Sauce secrète", description: "Avoir une sauce que les gens te supplient de refaire" },
    { title: "Mixologue culinaire", description: "Créer une sauce avec plus de 10 ingrédients" },
    { title: "Pot de confiture viral", description: "Que quelqu'un te demande de vendre tes confitures" }
  ],
  "Cuisiner pour la santé" => [
    { title: "Coach nutrition", description: "Inspirer quelqu'un à mieux manger grâce à toi" },
    { title: "Détox master", description: "Tenir une semaine de repas 100% healthy" },
    { title: "Green smoothie addict", description: "Boire un smoothie vert 30 jours de suite" }
  ],
  "Maîtriser la cuisine rapide" => [
    { title: "Speed chef", description: "Préparer un repas complet en moins de 10 minutes" },
    { title: "Multitasking culinaire", description: "Cuisiner 3 plats en même temps sans rien brûler" },
    { title: "Pompier du dîner", description: "Sauver un repas qui allait cramer" }
  ],

  # SOMMEIL
  "Atteindre les rêves lucides" => [
    { title: "Architecte onirique", description: "Construire un monde entier dans un rêve" },
    { title: "Inception réalisé", description: "Faire un rêve dans un rêve" },
    { title: "Maître du vol", description: "Voler dans un rêve lucide pendant plus de 5 minutes" }
  ],
  "Améliorer la qualité du sommeil" => [
    { title: "Marmotte légendaire", description: "Dormir 12h d'affilée un weekend" },
    { title: "Dormeur olympique", description: "S'endormir en moins de 2 minutes" },
    { title: "Réveil naturel", description: "Se réveiller pile à l'heure sans alarme" }
  ],
  "S'endormir plus rapidement" => [
    { title: "Koala humain", description: "S'endormir dans un transport en commun" },
    { title: "Maître du power nap", description: "Faire une sieste de 20 min et se réveiller frais" },
    { title: "Narcoleptique contrôlé", description: "S'endormir sur commande n'importe où" }
  ],
  "Créer une routine de coucher stable" => [
    { title: "Horloge suisse", description: "Se coucher à la même heure 30 jours de suite" },
    { title: "Rituel sacré", description: "Ne jamais rater ta routine même en voyage" },
    { title: "Influenceur sommeil", description: "Convertir quelqu'un à ta routine" }
  ],
  "Se réveiller en forme" => [
    { title: "Morning person", description: "Aimer sincèrement les matins (exploit rare)" },
    { title: "Chanteur matinal", description: "Chanter sous la douche avant 7h" },
    { title: "Productivité matinale", description: "Accomplir plus avant 9h que certains dans la journée" }
  ],
  "Réduire les réveils nocturnes" => [
    { title: "Sommeil de bébé", description: "Dormir 8h sans un seul réveil" },
    { title: "Insensible au bruit", description: "Dormir malgré un orage ou des travaux" },
    { title: "Zen nocturne", description: "Ne plus jamais checker ton téléphone la nuit" }
  ],
  "Optimiser son environnement de sommeil" => [
    { title: "Designer de chambre", description: "Que quelqu'un te demande des conseils déco" },
    { title: "Cave de luxe", description: "Avoir la chambre la plus sombre de ton immeuble" },
    { title: "Température parfaite", description: "Trouver LA température idéale et ne plus y toucher" }
  ],
  "Dormir sans stress" => [
    { title: "Maître zen", description: "S'endormir sereinement la veille d'un examen" },
    { title: "Cerveau off", description: "Réussir à ne penser à rien avant de dormir" },
    { title: "Anti-anxiété", description: "Dormir 8h avant un événement stressant" }
  ],
  "Allonger la durée de sommeil" => [
    { title: "Hibernation humaine", description: "Dormir plus de 10h sans réveil" },
    { title: "Dette remboursée", description: "Rattraper des années de manque de sommeil" },
    { title: "Weekend royale", description: "Passer un weekend entier à dormir" }
  ],
  "Maîtriser son rythme circadien" => [
    { title: "Horloge interne parfaite", description: "Prédire l'heure exacte au réveil" },
    { title: "Voyageur temporel", description: "S'adapter à un nouveau fuseau en 24h" },
    { title: "Solaire humain", description: "Se réveiller naturellement au lever du soleil" }
  ],

  # DIVERTISSEMENT
  "Regarder 10 films cultes" => [
    { title: "Critique de Cannes", description: "Débattre d'un film pendant plus d'une heure" },
    { title: "Répliqueur fou", description: "Connaître par cœur les répliques de 3 films" },
    { title: "Marathonien ciné", description: "Regarder 5 films en une journée" }
  ],
  "Terminer 5 jeux vidéo" => [
    { title: "No life assumé", description: "Jouer plus de 12h d'affilée" },
    { title: "100% completion", description: "Débloquer tous les succès d'un jeu" },
    { title: "Speedrunner", description: "Finir un jeu en moins de temps que prévu" }
  ],
  "Lire 5 livres différents" => [
    { title: "Rat de bibliothèque", description: "Finir un livre en une journée" },
    { title: "Bookstagrammer", description: "Avoir une jolie photo de livre avec 100+ likes" },
    { title: "Convertisseur littéraire", description: "Faire lire un livre à quelqu'un qui ne lit jamais" }
  ],
  "Regarder 10 séries" => [
    { title: "Binge-watcher pro", description: "Finir une saison en 24h" },
    { title: "Théoricien fou", description: "Prédire correctement la fin d'une série" },
    { title: "Spoiler-proof", description: "Éviter tous les spoilers pendant 1 mois" }
  ],
  "Résoudre un Rubik's Cube" => [
    { title: "Speedcuber", description: "Résoudre le cube en moins d'une minute" },
    { title: "Cuber aveugle", description: "Résoudre le cube les yeux fermés" },
    { title: "Professeur cube", description: "Apprendre à quelqu'un d'autre à le résoudre" }
  ],
  "Découvrir des animes" => [
    { title: "Weeb officiel", description: "Dire 'sugoi' ou 'kawaii' dans la vraie vie" },
    { title: "Cosplayer", description: "Se déguiser en personnage d'anime" },
    { title: "Otaku veteran", description: "Avoir vu plus de 50 animes" }
  ],
  "Créer ton top 10 films" => [
    { title: "Critique respecté", description: "Que quelqu'un regarde un film grâce à ton top" },
    { title: "Débatteur cinéphile", description: "Défendre ton top pendant 30 minutes" },
    { title: "Top évolutif", description: "Changer ton top après un coup de cœur" }
  ],
  "Créer ton top 10 jeux vidéo" => [
    { title: "Gamer influent", description: "Faire acheter un jeu à quelqu'un grâce à ton top" },
    { title: "Nostalgique", description: "Avoir un jeu d'enfance dans ton top" },
    { title: "Rétro gamer", description: "Avoir un jeu de plus de 20 ans dans ton top" }
  ],
  "Créer ton top 10 livres" => [
    { title: "Passeur de livres", description: "Prêter un livre de ton top à 5 personnes" },
    { title: "Relecteur compulsif", description: "Relire un livre de ton top 3 fois" },
    { title: "Auteur préféré", description: "Avoir 2 livres du même auteur dans ton top" }
  ],
  "Tester 5 activités fun inédites" => [
    { title: "Yes man/woman", description: "Dire oui à une activité qui te faisait peur" },
    { title: "Aventurier urbain", description: "Découvrir une activité dans ta propre ville" },
    { title: "Influenceur d'activités", description: "Faire découvrir une activité à 5 personnes" }
  ],

  # CREATIF
  "Peindre un tableau" => [
    { title: "Galerie perso", description: "Avoir une œuvre accrochée chez quelqu'un d'autre" },
    { title: "Artiste vendu", description: "Vendre une de tes créations" },
    { title: "Bob Ross vibes", description: "Peindre en regardant un tutoriel Bob Ross" }
  ],
  "Réaliser un dessin quotidien" => [
    { title: "Inktober champion", description: "Compléter un challenge Inktober" },
    { title: "Carnet légendaire", description: "Remplir un carnet entier de dessins" },
    { title: "Artiste de rue", description: "Dessiner un portrait pour un inconnu" }
  ],
  "Sculpter une création" => [
    { title: "Sculpteur de rue", description: "Créer une sculpture en public" },
    { title: "Argile master", description: "Faire une sculpture reconnue par tous" },
    { title: "Musée personnel", description: "Exposer tes sculptures chez toi" }
  ],
  "Participer à un challenge artistique" => [
    { title: "Challenge addict", description: "Participer à 3 challenges en même temps" },
    { title: "Viral artist", description: "Avoir une création partagée plus de 100 fois" },
    { title: "Jury populaire", description: "Être choisi pour juger un challenge" }
  ],
  "Expérimenter 3 techniques artistiques différentes" => [
    { title: "Touche-à-tout créatif", description: "Mélanger 3 techniques en une œuvre" },
    { title: "Innovateur artistique", description: "Inventer ta propre technique" },
    { title: "Prof d'art improvisé", description: "Enseigner une technique à quelqu'un" }
  ],
  "Créer un objet DIY" => [
    { title: "Maker officiel", description: "Que quelqu'un te demande de lui en faire un" },
    { title: "Recycleur créatif", description: "Créer un objet 100% recyclé" },
    { title: "Cadeau fait main", description: "Offrir un DIY qui fait pleurer de joie" }
  ],
  "Coudre un accessoire" => [
    { title: "Couturier demandé", description: "Recevoir une commande de couture" },
    { title: "Upcycling master", description: "Transformer un vieux vêtement en accessoire cool" },
    { title: "Fashion designer", description: "Porter ta création en public" }
  ],
  "Fabriquer un bijou" => [
    { title: "Bijoutier officiel", description: "Que quelqu'un porte ton bijou au quotidien" },
    { title: "Collection capsule", description: "Créer une collection de 5 bijoux assortis" },
    { title: "Vendeur Etsy", description: "Mettre un bijou en vente en ligne" }
  ],
  "Décorer une pièce" => [
    { title: "Influenceur déco", description: "Inspirer quelqu'un pour sa propre déco" },
    { title: "Magazine ready", description: "Avoir une pièce digne d'un magazine" },
    { title: "Avant/Après viral", description: "Poster un avant/après qui fait sensation" }
  ],
  "Photographier et retoucher" => [
    { title: "Photo virale", description: "Avoir une photo partagée plus de 1000 fois" },
    { title: "Client surprise", description: "Qu'on te demande de photographier un événement" },
    { title: "Exposition solo", description: "Organiser une exposition de tes photos" }
  ],

  # SANTE
  "Boire 2 litres d'eau par jour" => [
    { title: "Chameau humain", description: "Boire 3L en une journée de canicule" },
    { title: "Gourde addict", description: "Ne jamais sortir sans ta gourde pendant 1 mois" },
    { title: "Hydratation virale", description: "Convertir 5 personnes à boire plus d'eau" }
  ],
  "Manger équilibré pendant une semaine" => [
    { title: "Meal prep master", description: "Préparer tous tes repas du dimanche pour la semaine" },
    { title: "Zéro craquage", description: "Résister à une tentation sucrée en plein régime" },
    { title: "Nutritionniste amateur", description: "Que quelqu'un te demande des conseils nutrition" }
  ],
  "Dormir 7-8 heures par nuit" => [
    { title: "Régularité parfaite", description: "7-8h de sommeil pendant 30 jours consécutifs" },
    { title: "Goodbye cernes", description: "Que quelqu'un remarque que tu as l'air reposé" },
    { title: "Productivité décuplée", description: "Sentir une vraie différence dans ton énergie" }
  ],
  "Marcher 10 000 pas par jour" => [
    { title: "Ultra marcheur", description: "Faire 20 000 pas en une journée" },
    { title: "Marcheur social", description: "Convaincre un ami de marcher avec toi tous les jours" },
    { title: "Challenge collectif", description: "Organiser un challenge marche avec des amis" }
  ],
  "Faire du sport 3 fois par semaine" => [
    { title: "Athlete confirmé", description: "Ne jamais rater une séance pendant 2 mois" },
    { title: "Coach improvisé", description: "Entraîner quelqu'un d'autre" },
    { title: "Addiction positive", description: "Te sentir mal quand tu ne fais PAS de sport" }
  ],
  "Réduire le sucre" => [
    { title: "Détox complète", description: "Zéro sucre ajouté pendant 2 semaines" },
    { title: "Goût retrouvé", description: "Trouver les fruits suffisamment sucrés" },
    { title: "Résistance aux desserts", description: "Refuser un gâteau d'anniversaire" }
  ],
  "Méditer ou respirer 5 min par jour" => [
    { title: "Zen master", description: "Méditer 1h d'affilée" },
    { title: "Retraite silencieuse", description: "Faire une journée de méditation" },
    { title: "Moine urbain", description: "Méditer dans un lieu public bondé" }
  ],
  "Limiter écran avant le coucher" => [
    { title: "Digital detox", description: "Une journée entière sans écran" },
    { title: "Lecteur nocturne", description: "Remplacer le téléphone par un livre pendant 1 mois" },
    { title: "Réveil analogique", description: "Utiliser un réveil physique au lieu du téléphone" }
  ],
  "Faire un check-up santé" => [
    { title: "Patient modèle", description: "Faire tous les examens recommandés" },
    { title: "Prévention totale", description: "Prendre un RDV de prévention chaque année" },
    { title: "Docteur approuvé", description: "Recevoir des félicitations de ton médecin" }
  ],
  "Réduire stress et anxiété" => [
    { title: "Calme olympien", description: "Rester zen dans une situation qui t'aurait stressé avant" },
    { title: "Thérapeute amateur", description: "Aider quelqu'un à se calmer avec tes techniques" },
    { title: "Sérénité contagieuse", description: "Que quelqu'un te dise que tu as l'air apaisé" }
  ]
}

Goal.find_each do |goal|
  if HIDDEN_BADGES[goal.name]
    HIDDEN_BADGES[goal.name].each do |badge_data|
      Badge.find_or_create_by!(
        title: badge_data[:title],
        goal: goal,
        hidden: true
      ) do |b|
        b.description = badge_data[:description]
      end
    end
    puts "  -> Created hidden badges for: #{goal.name}"
  else
    puts "  -> No hidden badges defined for: #{goal.name}"
  end
end

puts "Hidden badges creation completed!"
