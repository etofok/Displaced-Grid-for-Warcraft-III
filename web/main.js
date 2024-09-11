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
        'assets/modules/1_thumb.png', 
        'assets/modules/1_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: You must click left mouse button on target. <br> Most games of today do have Quick Casts in-built already. <br> *Warcraft III:R does have Ability Quick Casts half implemented by Blizz. This is not a Displaced Grid module.'
        ),
    m_QuickCastItems            = new ModuleData(
        1, 
        'QuickCast Items', 
        'Item ability fires immediately on key activation at the cursor. No mouse click required!', 
        'assets/modules/2_thumb.png', 
        'assets/modules/2_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: You must click left mouse button on target. <br> This module does something most todays games do by default - enables you to target cast items without the extra click.'
        ),
    m_HoldCast                = new ModuleData(
        2, 
        'Rapid Fire Casting', 
        'Hold down the ability key to fire repeatedly!', 
        'assets/modules/3_thumb.png', 
        'assets/modules/3_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: When you get an Error (or want cast something again) you must let go of the ability key and then press it again. This module enables you to just hold down the Ability / Item key. <br> Great synergy with Quick Cast!'
        ),
    m_ShiftQueueItems      = new ModuleData(
        3, 
        'Shift-Queue Items', 
        'Shift-Queue Items while holding Shift!', 
        'assets/modules/4_thumb.png', 
        'assets/modules/4_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: To Shift-Queue multiple Items you have to let go of the Shift key before using the Item hotkey. <br> This module enables you to just hold down the Shift key and queue as much as you want without letting go of the Shift key each time. <br> Great synergy with Quick Casts and Hold Cast!'
        ),
    m_AltKeyImprovements        = new ModuleData(
        4, 
        'Cast on Yourself', 
        'Alt + Double-Tap to target yourself!', 
        'assets/modules/5_thumb.png', 
        'assets/modules/5_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: None. <br> Warcraft III does not have "Self Target" / "Self Cast" functionality to help players with in-battle control. <br> Bonus: Alt no longer prevents Ability use. <br> By default in Warcraft III, holding the Alt key flat out blocks the usage of abilities and items.'
        ),
    m_CommandMultipleGroups           = new ModuleData(
        5, 
        'Command Multiple Groups', 
        'Issue an Attack/Move/Cast/etc command to ALL designated control groups at ONCE!', 
        'assets/modules/6_thumb.png', 
        'assets/modules/6_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: 1-a-click-2-a-click-3-a-click-4-a-click to issue an attack command to groups 1 2 3 4. <br> With this module you just press Caps + Attack. <br> Works with mouse right click i.e. Caps + Right Click to move/attack. <br> Has extra synergy with Quick Cast, especially for Undead (Coil/Nova/Swarm/Impale share the same hotkey).'
        ),
    m_CameraHotkeys             = new ModuleData(
        6, 
        'Camera Hotkeys | Instant pan', 
        'Instant camera jump for designated control groups!', 
        'assets/modules/7_thumb.png', 
        'assets/modules/7_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: None. <br> This module enables you to use control groups as pseudo camera hotkeys. <br> Meaning, your camera will jump to the unit/building as soon as you press the key. <br> Defaults are control groups 7,8,9,0 which in Displaced Grid are rebound to f1 f2 f3 f4.'
        ),
    m_QuickDropItems            = new ModuleData(
        7, 
        'QuickDrop Items', 
        'Instantly Pass, Sell or Drop items on target!', 
        'assets/modules/8_thumb.png', 
        'assets/modules/8_video.mp4', 
        'e_slideBig',
        'e_thumbnail',
        'Default behavior: None. <br> In Warcraft III you manipulate inventory through drag-and-drop. <br> This module enables you to hold down CTRL and press the item hotkey to quickly Drop/Pass/Sell the item. <br> P.S. You will need to set up a few things for this module to work.'
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