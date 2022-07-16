<template>
    <section class="crew-container">
        <div class="crew-card-container">
            <div class="crew-card-information-container">
                <div class="intro-title-container">
                    <p class="intro-title"><span>02</span>MEET YOUR CREW</p>
                </div>
                <div class="crew-info-container">
                    <p class="crew-position">{{ crewPosition }}</p>
                    <p class="crew-name" :class="changeSizeCrewName">{{ actualMember }}</p>
                    <p class="crew-bio">{{ crewDescription }}</p>
                </div>
                <div class="crew-buttons-container">
                    <button class="crew-button" :class="douglasActive" @click="changeToDouglas"></button>
                    <button class="crew-button" :class="markActive" @click="changeToMark"></button>
                    <button class="crew-button" :class="gloverActive" @click="changeToGlover"></button>
                    <button class="crew-button" :class="ansariActive" @click="changeToAnsari"></button>
                </div>
            </div>
           <div class="crew-picture-information" :class="dynamicBackground">
            </div> 
        </div>
    </section>    
</template>

<script setup>
import { computed, ref, defineProps } from 'vue';

//PROPS
const props = defineProps({
    json: Object
})

//VARIABLES
const actualMember = ref("DOUGLAS HURLEY");


//COMPUTED VARIABLES
let dynamicBackground = computed(() => {
    switch (actualMember.value) {
        case "DOUGLAS HURLEY":
            return ".crew-picture-information backgroundDouglas";
        case "MARK SHUTTLEWORTH":
            return ".crew-picture-information backgroundMark";
        case "VICTOR GLOVER":
            return ".crew-picture-information backgroundGlover";
        case "ANOUSHEH ANSARI":
            return ".crew-picture-information backgroundAnsari";
        default:
            return ".crew-picture-information backgroundDouglas"
    }
})
let douglasActive = computed(() => {
    if (actualMember.value == "DOUGLAS HURLEY") {
        return ".crew-button crew-button-active"
    } else {
        return ".crew-button"
    }
})
let markActive = computed(() => {
    if (actualMember.value == "MARK SHUTTLEWORTH") {
        return ".crew-button crew-button-active"
    } else {
        return ".crew-button"
    }
})
let gloverActive = computed(() => {
    if (actualMember.value == "VICTOR GLOVER") {
        return ".crew-button crew-button-active"
    } else {
        return ".crew-button"
    }
})
let ansariActive = computed(() => {
    if (actualMember.value == "ANOUSHEH ANSARI") {
        return ".crew-button crew-button-active"
    } else {
        return ".crew-button"
    }
})
let changeSizeCrewName = computed(() => {
    if (actualMember.value == "MARK SHUTTLEWORTH" || actualMember.value == "ANOUSHEH ANSARI") {
        return ".crew-name smaller-name";
    } else {
        return ".crew-name";
    }
})
let crewPosition = computed(() => {
    switch (actualMember.value) {
        case "DOUGLAS HURLEY":
            return props.json[0].role.toUpperCase();
        case "MARK SHUTTLEWORTH":
            return props.json[1].role.toUpperCase();
        case "VICTOR GLOVER":
            return props.json[2].role.toUpperCase();
        case "ANOUSHEH ANSARI":
            return props.json[3].role.toUpperCase();
        default:
            return props.json[0].role.toUpperCase();
    }
}) 
let crewDescription = computed(() => {
    switch (actualMember.value) {
        case "DOUGLAS HURLEY":
            return props.json[0].bio;
        case "MARK SHUTTLEWORTH":
            return props.json[1].bio;
        case "VICTOR GLOVER":
            return props.json[2].bio;
        case "ANOUSHEH ANSARI":
            return props.json[3].bio;
        default:
            return props.json[0].bio;
    }
}) 

//FUNCTIONS
function changeToDouglas() {
    actualMember.value = "DOUGLAS HURLEY";
}
function changeToMark() {
    actualMember.value = "MARK SHUTTLEWORTH";
}
function changeToGlover() {
    actualMember.value = "VICTOR GLOVER";
}
function changeToAnsari() {
    actualMember.value = "ANOUSHEH ANSARI";
}


</script>


<style scoped>
.crew-container {
    height: 84vh;
    width: 100vw;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: absolute;
    bottom: 0px;
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
.crew-card-container {
    width: 73%;
    height: 90%;
    position: absolute;
    bottom: 0;
    display: flex;
}
.crew-card-information-container {
    width: 50%;
    height: 100%;
}
.intro-title {
    font-family: var(--barlow-condensed-regular);
    font-size: var(--heading5);
    color: var(--letter-color3);
    letter-spacing: var(--heading5-letter-space);
    margin: 0;
}
.intro-title span {
    opacity: 0.25;
    margin: 0 15px 0 0; 
}
.crew-position {
    font-size: var(--heading4);
    font-family: var(--bellefair-regular);
    color: var(--letter-color3);
    opacity: 0.5;
    margin: 50px 0 0 0;    
}
.crew-name {
    font-size: var(--heading3);
    font-family: var(--bellefair-regular);
    color: var(--letter-color3);
    margin: 10px 0 0 0;
}
.smaller-name {
    font-size: 45px;    
}
.crew-bio {
    width: 80%;
    font-size: 18px;
    font-family: 'Barlow', sans-serif;
    color: var(--letter-color2);
    line-height: 32px;
    text-align: justify;
}
.crew-buttons-container {
    width: 100%;
    height: auto;
    display: flex;
    position: absolute;
    bottom: 50px;
    gap: 24px;
    margin: 55px 0 0 0;
}
.crew-button {
    width: 15px;
    height: 15px;
    border: none;
    border-radius: 50%;
    color: var(--letter-color3);
    opacity: 0.17;
    cursor: pointer;
}
.crew-button:hover {
    opacity: 1;
}
.crew-button-active {
    opacity: 1;
}

.crew-picture-information {
    width: 50%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-size: contain;
}
.backgroundDouglas {
    background-image: url("../assets/crew/image-douglas-hurley.webp");
}
.backgroundMark {
    position: absolute;
    left: 450px;
    background-image: url("../assets/crew/image-mark-shuttleworth.webp");
}
.backgroundGlover {
    background-image: url("../assets/crew/image-victor-glover.webp");
}
.backgroundAnsari {
    background-image: url("../assets/crew/image-anousheh-ansari.webp");
}

@media screen and (max-width: 768px) {
    .crew-container {
        position: static;
        height: 100%;
    }
    .crew-card-container {
        width: 100%;
        margin: 136px 0 0 0;
        position: static;
        justify-content: space-between;
        flex-direction: column;
        align-items: center;
    }
    .crew-card-information-container {
        width: 100%;
        height: auto;
    }
    .intro-title-container {
        padding: 0 0 0 38.5px;
    }
    .intro-title {
        font-size: 20px;
        letter-spacing: 3.38px;
    }
    .crew-info-container {
    align-self: center;
    width: 592px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    }
    .crew-position {
        margin: 60px 0 0 0;
        font-size: 24px;
        line-height: 27.5px;
    }
    .crew-name {
        font-size: 40px;
        line-height: 45.84px;
        margin: 8px 0 0 0;
    }
    .crew-bio {
        margin: 16px 0 0 0;
        font-size: 16px;
        width: 100%;
        text-align: center;
    }
    .crew-buttons-container {
        justify-content: center;
        gap: 16px;
        bottom: 572px;
        margin: 0;
    }
    .crew-button {
        width: 10px;
        height: 10px;
    }
    .crew-picture-information {
        margin: 80px 0 0 0;
        width: 456px;
    }
    .backgroundMark {
        position: static;
    }
}

@media screen and (max-width: 375px) {
    .crew-card-container {
        flex-direction: column-reverse;
        justify-content: flex-end;
        margin: 88px 0 0 0;
        height: 100%
    }
    .intro-title-container {
        padding: 0;
        text-align: center;
        margin: -283px 0 0 0;
    }
    .crew-picture-information {
        width: 327px;
        height: 223px;
        margin: 51px 0 0 0;
        border-bottom: solid 1px #383B4B;
    }
    .intro-title {
        font-size: var(--nav-text);
        letter-spacing: var(--nav-text-letter-space);
        line-height: 19.2px;
    }
    .crew-buttons-container {
        top: 394px;
    }
    .crew-button {
        width: 10px;
        height: 10px;
    }
    .crew-info-container {
        width: 327px;
        
    }
    .crew-position {
        margin: 329px 0 0 0;
        font-size: 16px;
        line-height: 18.34px;

    }
    .crew-name {
        font-size: 24px;
        line-height: 27.5px;
        margin: 8px 0 0 0;
    }
    .crew-bio {
        font-size: 15px;
        line-height: 25px;
    }
}

@media screen and (min-width: 1440px) {
    .crew-card-container {
        width: 1135.5px;
        height: 654px;
    }
    .crew-position {
        margin: 154px 0 0 0;
    }
    .crew-name {
        margin: 15px 0 0 0;
    }
    .crew-bio {
        width: 444px;
        margin: 27px 0 0 0;
    }
    .crew-buttons-container {
        bottom: 94px;
    }
    .backgroundGlover {
        width: 65%;
        margin: 0 -80px 0 0;
    }
    .backgroundAnsari {
        width: 65%;
        margin: 0 -80px 0 0;
    }
}

</style>