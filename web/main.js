class ModuleData {
  constructor(id, name, description, image, videoSrc, e_slideBig, e_thumbnail, tooltip) {
    this.id                 = id;
    this.name               = name;
    this.description        = description;
    this.image              = image;
    this.videoSrc           = videoSrc;
    this.e_slideBig         = e_slideBig;
    this.e_thumbnail        = e_thumbnail;
    this.tooltip            = tooltip;
  }
}

const modules = [
    m_QuickCastAbilities         = new ModuleData(
        0, 
        'QuickCast Abilities*', 
        'Ability fires immediately on key activation at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Abilities.png', 
        'assets/modules/QuickCast Abilities.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Most games of 2025 already have Quick Casts. <br> *Warcraft III:R DOES have Ability Quick Casts somewhat implemented by Blizz.<br> This is not a Displaced Grid module, but we are going to take advantage of it.'
        ),
    m_QuickCastItems            = new ModuleData(
        1, 
        'QuickCast Items', 
        'Item ability fires immediately on key activation at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Items.png', 
        'assets/modules/QuickCast Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This module enables you to cast items without the mouse click.'
        ),
    m_RapidFire                = new ModuleData(
        2, 
        'Rapid Fire Casting', 
        'Hold down the ability key to fire repeatedly!', 
        'assets/modules/Rapid Fire Casting.png', 
        'assets/modules/Rapid Fire Casting.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This module allows you to hold down a hotkey to repeatedly activate its command. <br> Great synergy with Quick Cast!'
        ),
    m_CommandMultipleGroups           = new ModuleData(
        3, 
        'Command Multiple Groups', 
        'Attack/Move/Cast/etc with multiple control groups at ONCE!', 
        'assets/modules/Command Multiple Groups.png', 
        'assets/modules/Command Multiple Groups.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: 1-a-click-2-a-click-3-a-click-4-a-click to issue an attack command to groups 1 2 3 4. <br> This module adds a new key modifier - CapsLock - so that you can just press CapsLock + Attack to attack with multiple groups. <br> Works with mouse right click i.e. CapsLock + Right Click to move/attack. <br> Works for abilities just as well.'
        ),    
    m_SetSkillPoint           = new ModuleData(
        4, 
        'Set Skill Point', 
        'Quickly level up your ability using CTRL + ability key!', 
        'assets/modules/Set Skill Point.png', 
        'assets/modules/Set Skill Point.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Very nice.'
        ),
    m_CastOnYourself        = new ModuleData(
        5, 
        'Cast on Yourself', 
        'Alt + Ability to Cast on Yourself!', 
        'assets/modules/Cast on Yourself.png', 
        'assets/modules/Cast on Yourself.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Warcraft III does not have "Cast on Yourself" functionality. <br> Now it does. <br> Unfortunately, doesnt work for Items'
        ),
    m_QuickDropItems            = new ModuleData(
        6, 
        'QuickDrop Items', 
        'Instantly Pass, Sell or Drop items on target!', 
        'assets/modules/QuickDrop Items.png', 
        'assets/modules/QuickDrop Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'In Warcraft III you manipulate the inventory through drag-and-drop. <br> This module adds a new modifier key to Items - CTRL. <br> Hold CTRL and use the item to quickly Drop/Pass/Sell it. <br> P.S. You will need to set up a few things for this module to work.'
        ),
    m_CameraHotkeys             = new ModuleData(
        7, 
        'Instant Camera', 
        'Instant camera jump for control groups!', 
        'assets/modules/Instant Camera.png', 
        'assets/modules/Instant Camera.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: double-tap a control group to jump to it. <br> With this module you can single-tap a control group to jump to it.'
        ),
    m_ShiftQueueItems      = new ModuleData(
        8, 
        'Shift-Queue Items', 
        'Shift-Queue Items while holding Shift!', 
        'assets/modules/Shift-Queue Items.png', 
        'assets/modules/Shift-Queue Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This module allows you to hold down the Shift key to shift-queue items without letting go of the Shift key each time. <br> Great synergy with Quick Casts and RapidFire!'
        )
];

const e_moduleName              = document.getElementById("moduleName");
const e_moduleDesc              = document.getElementById("moduleDesc");
const e_moduleTooltip           = document.getElementById("moduleTooltip");
const e_moduleTooltipText       = document.getElementById("moduleTooltipText");
const modulesTotal              = modules.length;

let activeSlide                 = 0;






document.addEventListener('DOMContentLoaded', function() {

    // Slider
    var slider              = document.getElementById('slider');
    var beforeImg           = document.querySelector('.before-img');
    var afterImg            = document.querySelector('.after-img');
    var sliderButton        = document.querySelector('.slider-button');

    e_moduleTooltip.addEventListener('mousemove', () => {
        e_moduleTooltipText.style.visibility = 'visible';
    }) 

    e_moduleTooltip.addEventListener('mouseout', () => {
        e_moduleTooltipText.style.visibility = 'hidden';
    }) 

    function updateSlider(sliderPos) {
        var maskPosition = sliderPos + '%';
        beforeImg.style.maskImage = 'linear-gradient(to right, transparent ' + maskPosition + ', black ' + maskPosition + ')';
        afterImg.style.maskImage = 'linear-gradient(to right, black ' + maskPosition + ', transparent ' + maskPosition + ')';
        sliderButton.style.left = 'calc(' + sliderPos + '% - 18px)';
    }

    // Set up initial state of the slider
    var initialSliderPos = slider.value;
    updateSlider(initialSliderPos);

    // Add event listener for slider adjustments
    slider.addEventListener('input', function(e) {
        var sliderPos = e.target.value;
        updateSlider(sliderPos);
    });


    // Listen to FAQ dropdown buttons
    const questionBtns = document.querySelectorAll('.question-button');

    questionBtns.forEach(function(btn) {

        btn.addEventListener('click', function() {
            const answer = this.nextElementSibling;
            //answer.style.display = answer.style.display === 'block' ? 'none' : 'block';

            if (answer.classList.contains("show")) {
              answer.classList.remove("show");
            } else {
              answer.classList.add("show");
            }

        });
    });




    // remove context menu for .nocontextmenu elements
    const nocontextmenus = document.querySelectorAll('.nocontextmenu');
    nocontextmenus.forEach(element => { 

       element.addEventListener('contextmenu', () => {
          event.preventDefault();
       })
    });




    // Generate Slides and Thumbnails from the ModuleData
    var e_containerSlideBig             = document.getElementById('container-slide-big');
    var e_containerThumbnails           = document.getElementById('container-thumbnails');
    
    for (let i = 0; i < modulesTotal; i++) {

        // Generate Slides
        let slideBig = document.createElement('div');
        slideBig.className = 'slide';

        let video = document.createElement('video');
        video.className = 'nocontextmenu';
        video.autoplay = true;
        video.muted = true;
        video.preload = 'auto';
        video.loop = true;
        video.playsInline = true;
        video.poster = '';

        let source = document.createElement('source');

        source.type = 'video/mp4';
        source.src = modules[i].videoSrc;

        video.appendChild(source);
        slideBig.appendChild(video);
        e_containerSlideBig.appendChild(slideBig);

        modules[i].e_slideBig = slideBig;

        // Generate Thumbnails
        let thumbnail = document.createElement('input');

        thumbnail.type = 'button';
        thumbnail.className = 'button-slide-thumbnail';
        thumbnail.style.backgroundImage = 'url("' + modules[i].image + '")';

        e_containerThumbnails.appendChild(thumbnail);  
        modules[i].e_thumbnail = thumbnail;

        thumbnail.addEventListener('click', () => {
            event.preventDefault();
            DisplayModule(i);
       });

    }

    DisplayModule(activeSlide);
});



function DisplayModule(position) {

    for (let i = 0; i < modulesTotal; i++) {
        
        if (i === position) {

            activeSlide = position;

            modules[i].e_slideBig.style.display = 'block';
            modules[i].e_slideBig.classList.add('active');
            modules[i].e_thumbnail.classList.add('active');
        } else {

            modules[i].e_slideBig.style.display = 'none';
            modules[i].e_slideBig.classList.remove('active');
            modules[i].e_thumbnail.classList.remove('active');
        }

    }

    e_moduleName.innerHTML          = modules[position].name;   
    e_moduleDesc.innerHTML          = modules[position].description;
    e_moduleTooltipText.innerHTML   = modules[position].tooltip;
}



function nextSlide() {
    activeSlide = (activeSlide + 1) % modulesTotal;
    DisplayModule(activeSlide);
}

function prevSlide() {
    activeSlide = (activeSlide - 1 + modulesTotal) % modulesTotal;
    DisplayModule(activeSlide);
}


function checkForHTTP(str) {
    if (str.includes("http")) {
        return 1;
    } else {
        return 0;
    }
}



// Listen to FAQ dropdown buttons
const disabledBtns = document.querySelectorAll('.temp_disabled');

disabledBtns.forEach(function(btn) {
    var tempval = btn.innerHTML;

    btn.addEventListener('mousemove', function() {
        btn.innerHTML ='Join Launch Party';
    });

    btn.addEventListener('mouseout', function() {
        btn.innerHTML = tempval;
    });
});