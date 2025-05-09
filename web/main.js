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
        'QuickCast abilities*', 
        'Ability fires instantly at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Abilities.png', 
        'assets/modules/QuickCast Abilities.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Quick Casts are common in most games. <br> Quick Casts allow you to cast abilities instantly with a key press, eliminating the need for a mouse click. <br> Note that Warcraft III: Reforged already features some Ability Quick Cast functionality, implemented by Blizzard.<br> This isnt a Displaced Grid module, but we will utilize the built-in Quick Casts.'
        ),
    m_QuickCastItems            = new ModuleData(
        1, 
        'QuickCast items', 
        'Item fires instantly at the cursor. No mouse click required!', 
        'assets/modules/QuickCast Items.png', 
        'assets/modules/QuickCast Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This module allows you to cast items instantly with a key press, eliminating the need for a mouse click.'
        ),
    m_RapidFire                = new ModuleData(
        2, 
        'Rapid Fire casting', 
        'Press and hold ability key to fire repeatedly!', 
        'assets/modules/Rapid Fire Casting.png', 
        'assets/modules/Rapid Fire Casting.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Holding down an ability hotkey will repeatedly activate its command. <br> This has great synergy with Quick Casts.'
        ),
    m_CommandMultipleGroups           = new ModuleData(
        3, 
        'Command multiple groups', 
        'Attack, move, cast simultaneously with multiple control groups!', 
        'assets/modules/Command Multiple Groups.png', 
        'assets/modules/Command Multiple Groups.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'The default behavior requires individually selecting each control group (1, 2, 3, 4) and issuing a command and a mouse click for each group. <br> This module introduces a new key modifier, Caps Lock. By pressing and holding Caps Lock while issuing a command, you can simultaneously command multiple control groups. This functionality also extends to mouse right-click actions; for example, pressing Caps Lock and right-clicking will issue a move or attack command to multiple groups.'
        ),    
    m_SetSkillPoint           = new ModuleData(
        4, 
        'Set skill point', 
        'Press CTRL + ability key to level up the ability instantly!', 
        'assets/modules/Set Skill Point.png', 
        'assets/modules/Set Skill Point.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Similar behavior to games like Dota 2.'
        ),
    m_CastOnYourself        = new ModuleData(
        5, 
        'Cast on yourself', 
        'Press ALT + ability key to cast the ability on yourself!', 
        'assets/modules/Cast on Yourself.png', 
        'assets/modules/Cast on Yourself.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Warcraft III didn`t have a "Cast on Yourself" feature. Now it does. <br> Doesnt work for items.'
        ),
    m_QuickDropItems            = new ModuleData(
        6, 
        'QuickDrop items', 
        'Quickly pass, sell, or drop items at the cursor!', 
        'assets/modules/QuickDrop Items.png', 
        'assets/modules/QuickDrop Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'In Warcraft III, inventory management is done via drag-and-drop. <br> This module introduces a new modifier key for items: CTRL. <br> By holding CTRL and using an item, you can quickly Drop, Pass, or Sell it. <br> P.S. Please note that some initial setup is required for this module to function correctly.'
        ),
    m_CameraHotkeys             = new ModuleData(
        7, 
        'Instant camera', 
        'Instantly move the camera to the location of your selected control groups!', 
        'assets/modules/Instant Camera.png', 
        'assets/modules/Instant Camera.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'By default, double-tapping a control group key jumps the camera to that group. <br> This module enables you to change this behavior, allowing you to instantly jump to a control group with a single tap of its key.'
        ),
    m_ShiftQueueItems      = new ModuleData(
        8, 
        'Shift-Queue items', 
        'Shift-Queue items while holding Shift!', 
        'assets/modules/Shift-Queue Items.png', 
        'assets/modules/Shift-Queue Items.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'This is a support module that allows users to properly shift-queue abilities and items without letting go of the Shift key each time or while holding down Alt.'
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



