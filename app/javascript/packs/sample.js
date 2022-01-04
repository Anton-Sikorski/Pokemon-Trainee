let pokemon_sample = document.getElementById("sample");
let pokemon = pokemon_sample.getElementsByClassName("pokemon-card");

pokemon[0].style.display = 'block';
let position = 0;
let prev = document.getElementById("prev-pokemon");
let next = document.getElementById("next-pokemon");

next.addEventListener('click', () => {
    pokemon[position].style.display = 'none';

    if (position + 1 === pokemon.length ) {
        position = 0
    } else {
        position += 1
    }
    pokemon[position].style.display = 'block';
});

prev.addEventListener('click', () => {
    pokemon[position].style.display = 'none';

    if (position === 0 ) {
        position = pokemon.length-1
    } else {
        position -= 1
    }
    pokemon[position].style.display = 'block';
})