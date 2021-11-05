let html = document.getElementsByTagName('html')[0];

function hideSidebar(event){
    if (html.clientWidth < 1250){
        let form = document.getElementById('sidebar');
        form.style.display = "none";
    } else {
        let form = document.getElementById('sidebar');
        form.style.display = "flex";
    }
}

hideSidebar()
html.addEventListener('mousemove',hideSidebar)