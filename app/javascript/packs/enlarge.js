let sprites = document.getElementsByClassName("sprite")
let artwork = document.getElementsByClassName("artwork")[0].children
link = artwork[0].src

for (let sprite of sprites) {
    sprite.addEventListener('mouseover', () => {
        artwork[0].src = sprite.src
    })
}

for (let sprite of sprites) {
    sprite.addEventListener('mouseout', () => {
        artwork[0].src = link
    })
}