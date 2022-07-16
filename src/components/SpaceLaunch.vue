<template>
    <section class="tech-container">
        <div class="tech-card-container">
            <div>
                <p class="intro-title"><span>03</span>SPACE LAUNCH 101</p>
            </div>
            <div class="main-information-container">
                <div class="tech-buttons-container">
                    <button class="tech-button" :class="vehicleActive" @click="changeToVehicle">1</button>
                    <button class="tech-button" :class="spaceportActive" @click="changeToSpaceport">2</button>
                    <button class="tech-button" :class="capsuleActive" @click="changeToCapsule">3</button>
                </div>
                <div class="space-information-container">
                    <p class="terminology">THE TERMINOLOGY…</p>
                    <p class="space-title">{{ currentButton }}</p>
                    <p class="space-description">{{ techDescription }}</p>
                </div>
                <div class="picture-container" :class="changeBackground">
                    <img class="tech-picture" :src="imageSource" alt="">
                </div>
            </div>
        </div>
    </section>    
</template>



<script setup>
import { ref, defineProps, computed } from 'vue';

//PROPS
const props = defineProps({
    json: Object
})

//VARIABLES
let currentButton = ref("LAUNCH VEHICLE");

//COMPUTED VARIABLES
let techDescription = computed(() => {
    switch (currentButton.value) {
        case "LAUNCH VEHICLE":
            return props.json[0].description;
        case "SPACEPORT":
            return props.json[1].description;
        case "SPACE CAPSULE":
            return props.json[2].description;
        default:
            return props.json[0].description;
    }    
})
let imageSource = computed(() => {
    switch (currentButton.value) {
        case "LAUNCH VEHICLE":
            return require("../assets/technology/image-launch-vehicle-portrait.jpg");
        case "SPACEPORT":
            return require("../assets/technology/image-spaceport-portrait.jpg");
        case "SPACE CAPSULE":
            return require("../assets/technology/image-space-capsule-portrait.jpg");
        default:
            return require("../assets/technology/image-launch-vehicle-portrait.jpg");       
    }    
})
let changeBackground = computed(() => {
    switch (currentButton.value) {
        case "LAUNCH VEHICLE":
            return ".picture-container vehicle-background";
        case "SPACEPORT":
            return ".picture-container spaceport-background";
        case "SPACE CAPSULE":
            return ".picture-container capsule-background";
        default:       
            return ".picture-container vehicle-background";
    }   
})
let vehicleActive = computed(() => {
    if (currentButton.value == "LAUNCH VEHICLE") {
        return ".tech-button active-button";
    } else {
        return ".tech-button"
    }
})
let spaceportActive = computed(() => {
    if (currentButton.value == "SPACEPORT") {
        return ".tech-button active-button";
    } else {
        return ".tech-button"
    }
})
let capsuleActive = computed(() => {
    if (currentButton.value == "SPACE CAPSULE") {
        return ".tech-button active-button";
    } else {
        return ".tech-button"
    }
})
//FUNCTIONS
function changeToVehicle() {
    currentButton.value = "LAUNCH VEHICLE";
}
function changeToSpaceport() {
    currentButton.value = "SPACEPORT";
}
function changeToCapsule() {
    currentButton.value = "SPACE CAPSULE";
}

</script>




<style scoped>
.tech-container {
    height: 84vh;
    width: 100vw;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-end;
    position: absolute;
    bottom: 0px;
    --letter-color1: #0B0D17;  
    --letter-color2: #D0D6F9; 
    --letter-color3: #FFFFFF;
    --bellefair-regular: 'Bellefair', serif;
    --barlow-condensed-regular: 'Barlow Condensed', sans-serif;
    --heading1: 150px;
    --heading2: 100px;
    --heading3: 56px;
    --heading4: 32px;
    --heading5: 28px;
    --heading5-letter-space: 4.75px;
    --subheading2: 14px;
    --subheading2-letter-space: 2.35px;
    --nav-text: 16px;
    --nav-text-letter-space: 2.7px;    
}
.tech-card-container {
    width: 85%;
    height: 90%;
    position: absolute;
    display: flex;
    flex-direction: column;
}
.intro-title {
    font-family: var(--barlow-condensed-regular);
    font-size: var(--heading5);
    color: var(--letter-color3);
    letter-spacing: var(--heading5-letter-space);
    margin: 15px 0 0 0;    
}
.intro-title span {
    opacity: 0.25;
    margin: 0 15px 0 0; 
}
.main-information-container {
    width: 100%;
    height: auto;
    display: flex;
    justify-content: flex-end;
    margin: 20px 0 0 0;
}
.tech-buttons-container {
    width: 10%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 20px;
}
.tech-button {
    width: 70px;
    height: 70px;
    font-size: 28px;
    background-color: inherit;
    border: 1px solid var(--letter-color3);
    border-radius: 50%;
    color: var(--letter-color3);
    cursor: pointer;
}
.tech-button:hover {
    background-color: var(--letter-color3);
    color: var(--letter-color1);
}
.active-button {
    background-color: var(--letter-color3);
    color: var(--letter-color1);    
}
.space-information-container {
    width: 45%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 0 0 0 50px
}
.terminology {
    font-family: var(--barlow-condensed-regular);
    font-size: var(--nav-text);
    letter-spacing: var(--nav-text-letter-space);
    color: var(--letter-color2);
}
.space-title {
    font-family: var(--bellefair-regular);
    font-size: var(--heading3);
    color: var(--letter-color3);
    margin: 10px 0 0 0;
}
.space-description {
    font-family: 'Barlow', sans-serif;
    font-size: 18px;
    color: var(--letter-color2);
    line-height: 32px;
}
.picture-container {
    width: 50%;
    display: flex;
    justify-content: flex-end;
    background-image: none;
}
.vehicle-background {
    width: auto;
}
.spaceport-background {
    width: auto;
}
.capsule-background {
    width: auto;
}
.tech-picture {
    width: 70%;
    padding: 20px 0 0 0;
}

@media screen and (max-width: 768px) {
    .tech-container {
        position: static;
        height: 100%;
    }
    .tech-card {
        height: 100%;
    }
    .tech-card-container {
        width: 100%;
        height: 100%;
    }
    .intro-title {
        font-size: 20px;
        line-height: 24px;
        letter-spacing: 3.38px;
        margin: 136px 0 0 0;
        padding: 0 0 0 38.5px;
    }
    .main-information-container {
        margin: 60px 0 0 0;
        flex-direction: column-reverse;
    }
    .picture-container {
        width: 100%;
        height: 310px;
    }
    .vehicle-background {
    background-image: url("../assets/technology/image-launch-vehicle-landscape.jpg")
    }
    .spaceport-background {
        background-image: url("../assets/technology/image-spaceport-landscape.jpg")
    }
    .capsule-background {
        background-image: url("../assets/technology/image-space-capsule-landscape.jpg")
    }
    .tech-picture {
        padding: 0;
        display: none;
    }
    .space-information-container {
        width: 458px;
        margin: 0 auto;
        padding: 0;
        align-items: center;
    }
    .terminology {
        margin: 160px 0 0 0;
    }
    .space-title {
        font-size: 40px;
        margin: 16px 0 0 0;
    }
    .space-description {
        font-size: 16px;
        line-height: 28px;
        text-align: center;
    }
    .tech-buttons-container {
        width: 100%;
        flex-direction: row;
        position: absolute;
        bottom: 378px;
    }    
}


@media screen and (max-width: 375px) {
    .intro-title {
        margin: 88px 0 0 0;
        padding: 0;
        font-size: var(--nav-text);
        letter-spacing: var(--nav-text-letter-space);
        text-align: center;
        line-height: 19.2px;
    }
    .main-information-container {
        margin: 32px 0 0 0;
    }
    .picture-container {
        height: 170px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;  
    }
    .tech-buttons-container {
        top: 343px;
    }
    .tech-button {
        width: 40px;
        height: 40px;
        font-size: 16px;
        line-height: 18.34px;
    }
    .space-information-container {
        width: 327px;
        padding: 0;
        margin: 100px auto 0;
    }
    .terminology {
        margin: 0;
        font-size: 14px;
        letter-spacing: 2.36px;
        line-height: 16.8px;
    }
    .space-title {
        font-size: 24px;
        line-height: 27.5px;
        margin: 9px 0 0 0;
    }
    .space-description {
        margin: 16px 0 0 0;
        font-size: 15px;
        line-height: 25px;
    }
}

@media screen and (min-width: 1440px) {
    .tech-container {
        justify-content: flex-start;
    }
    .tech-card-container {
        width: 90%
    }
    .intro-title {
        margin: 76px 0 0 0;
    }
    .terminology {
        margin: 0 0 11px 0;
    }
    .space-description {
        width: 444px;
        margin: 17px 0 0 0;
    }
    .tech-button {
        width: 80px;
        height: 80px;
    }
    .tech-picture {
        width: 515px;
        padding: 0;
    }
}
</style>