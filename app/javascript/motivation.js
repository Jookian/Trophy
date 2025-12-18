const phrases = [
"Ne lâche rien",
"Un pas de plus",
"La constance bat le talent",
"Tout commence maintenant",
"Le chemin se crée en avançant",
"Petit à petit, tu vas loin",
"Tout est une question d’état d’esprit",
"La meilleure version de toi t’attend",
"L’effort finit toujours par payer",
"L’action crée la motivation",
"La discipline te mène plus loin",
"Ne doute jamais de toi",
"Tu peux faire mieux que tu ne l’imagines",
"Reste dans ta lancée",
"Choisis de te dépasser",
"Ta réussite commence par un choix",
"Continue même quand c’est dur",
"Le plus dur, c’est de commencer",
"Tu vas surprendre ton futur toi",
"La discipline, c’est la liberté",
"Garde le cap",
"Fais vibrer ton ambition",
"Chaque étape est une victoire",
"Tu es sur la bonne voie",
"Pas parfait, mais constant",
"L’effort précède le résultat",
"La motivation vient après",
"Rien d’extraordinaire, juste régulier",
"Fais le minimum, mais fais-le",
"La flemme passe, le regret reste",
"C’est mathématique",
"L’élan vient de la répétition",
];

function initMotivation() {
  const button = document.getElementById("phrase-btn");
  const popup = document.getElementById("motivation-popup");
  const text = document.getElementById("motivation-text");

  if (button && popup && text) {
    button.addEventListener("click", function() {
      const randomIndex = Math.floor(Math.random() * phrases.length);
      text.textContent = phrases[randomIndex];

      popup.classList.add("show");

      setTimeout(() => {
        popup.classList.remove("show");
      }, 5000);
    });
  }
}

document.addEventListener("DOMContentLoaded", initMotivation);
document.addEventListener("turbo:load", initMotivation);
