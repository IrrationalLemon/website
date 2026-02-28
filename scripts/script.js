//слайдер
const images = document.querySelectorAll('.slider img');
const controlls = document.querySelectorAll('.controlls');

//фотографии цветов памятников
const graveImages = {
    karelian: [
        'images/grave.jpg',
        'images/grave-kar1.jpeg',
        'images/grave-kar-2.jpg',
        'images/grave-kar3.png',
        'images/grave-kar4.png'
    ],
    balmoral: [
        'images/grave-balm1.jpg',
        'images/grave-balm2.jpg',
        'images/grave-balm3.jpg',
        'images/grave-3.jpg',
        'images/grave-4.jpg'
    ]
}

const colorButtons = document.querySelectorAll('.color-btn');
const graveImagesElements = document.querySelectorAll('.grave-image');

//функционал слайдера
let imageIndex = 0;

console.log('Images found:', images.length);  // Должно быть 3
console.log('Controls found:', controlls.length);  // Должно быть 2

function show(index){
    console.log('Showing index:', index);  // Отладка
    images[imageIndex].classList.remove('active'); 
    images[index].classList.add('active');
    imageIndex = index;
}

controlls.forEach((e) => {
    console.log('Control element:', e);  // Посмотрим что находим
    
    e.addEventListener('click', (event) => {
        console.log('Clicked!', event.target);  // Что кликнули?
        console.log('Classes:', event.target.classList);  // Какие классы?
        
        if(event.target.classList.contains('prev')){
            console.log('Prev clicked');
            let index = imageIndex - 1;
            if(index < 0){
                index = images.length - 1;
            }
            show(index);
        }
        else if(event.target.classList.contains('next')){
            console.log('Next clicked');
            let index = imageIndex + 1;
            if(index >= images.length){
                index = 0;
            }
            show(index);
        }
    });
});

// Убедимся что первый слайд активен
if(images.length > 0) {
    images[imageIndex].classList.add('active');
}

//функционал смены цветов
colorButtons.forEach(button => {
    button.addEventListener('click', (e) => {
        e.preventDefault(); // отменяем переход по ссылке
        
        const color = button.dataset.color; // получаем выбранный цвет
        const newImages = graveImages[color]; // массив картинок этого цвета
        
        // Меняем src у каждой картинки
        graveImagesElements.forEach((img, index) => {
            if (newImages[index]) {
                img.src = newImages[index];
            }
        });
        
        // Подсветка активной кнопки (опционально)
        colorButtons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
    });
});