const phrases = [
    "No pain, no gain",
    "Work hard, stay humble",
    "Ne lâche rien",
    "Un pas de plus",
"Tu es plus fort(e) que tu ne le crois",
"La constance bat le talent",
"Tout commence maintenant",
"Crois en toi",
"Le chemin se crée en avançant",
"Petit à petit, tu vas loin",
"Rien n’est impossible",
"Tout est une question d’état d’esprit",
"Sois fier(e) de chaque progrès",
"La meilleure version de toi t’attend",
"L’effort finit toujours par payer",
"L’action crée la motivation",
"Vise haut",
"La discipline te mène plus loin",
"Ne doute jamais de toi",
"Tu peux faire mieux que tu ne l’imagines",
"Reste dans ta lancée",
"Le courage, c'est maintenant",
"Choisis de te dépasser",
"Tu n’es jamais seul(e)",
"Rien ne t’arrête",
"Avance avec le sourire",
"Ose te surpasser",
"Ta réussite commence par un choix",
"Continue même quand c’est dur",
"Le plus dur, c’est de commencer",
"Donne-toi à fond",
"Construis ta légende",
"Sois ton propre héros",
"Tu n’es pas venu(e) jusqu’ici pour abandonner",
"Tu vas surprendre ton futur toi",
"La discipline, c’est la liberté",
"Ne perds jamais ton feu",
"Trust the process",
"Rien n’est trop grand",
"Garde le cap",
"Tu as déjà gagné en essayant",
"Tu progresses même quand tu doutes",
"Personne ne peut t’arrêter",
"Repousse tes limites",
"Garde ton énergie",
"Le succès aime les gens courageux",
"Tu es ta meilleure arme",
"Le monde appartient aux persévérants",
"Fais vibrer ton ambition",
"Stay focused",
"Chaque étape est une victoire",
"Ose rêver grand",
"Choisis le courage",
"Fonce, tout simplement",
"Ta détermination est ta force",
"Crois en ton potentiel",
"Tu es sur la bonne voie",
];
document.addEventListener("turbo:load", () => {
  const button = document.getElementById("phrase-btn");
  const popup = document.getElementById("motivation-popup");
  const text = document.getElementById("motivation-text");

  if (!button || !popup || !text) return;

  button.addEventListener("click", () => {
    const randomIndex = Math.floor(Math.random() * phrases.length);
    text.textContent = phrases[randomIndex];

    popup.classList.add("show");

    setTimeout(() => {
      popup.classList.remove("show");
    }, 5000);
  });
});