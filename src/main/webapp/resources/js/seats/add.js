const level = document.getElementById('level');
const price = document.getElementById('price');

level.addEventListener('change', ()=>{
    if(level.value == 'A'){
        price.value = 30000
    }else if(level.value == 'B'){
        price.value = 20000
    }else {
        price.value = 15000
    }
})

