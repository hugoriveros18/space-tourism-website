<template>
    <section class="pick-destination-container">
        <div class="destination-card-container">
            <div class="intro-title-container">
                <p class="intro-title"><span>01</span>PICK YOUR DESTINATION</p>
            </div>
            <div class="planet-card-container">
                <picture class="picture-container">
                    <img class="picture-planet" :src="imageSource" alt="">
                </picture>
                <div class="information-container">
                    <div class="buttons-container">
                        <button class="planet-button" :class="buttonStyleMoon" @click="changeToMoon">MOON</button>
                        <button class="planet-button" :class="buttonStyleMars" @click="changeToMars">MARS</button>
                        <button class="planet-button" :class="buttonStyleEuropa" @click="changeToEuropa">EUROPA</button>
                        <button class="planet-button" :class="buttonStyleTitan" @click="changeToTitan">TITAN</button>
                    </div>
                    <p class="planet-title">{{ actualPlanet }}</p>
                    <div class="planet-information-container">
                        <p class="planet-information">{{ planetDescription }}</p>
                    </div>
                    <div class="details-container">
                        <div class="details-inside-container">
                            <p class="main-title">AVG. DISTANCE</p>
                            <p class="description">{{ planetDistance }}</p>
                        </div>
                        <div class="details-inside-container">
                            <p class="main-title">EST. TRAVEL TIME</p>
                            <p class="description">{{ planetTravelTime }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    
</template>

<script setup>
import { defineProps, ref, computed } from 'vue';

//PROPS
const props = defineProps({
    json: Object
})

//VARIABLES
let actualPlanet = ref("MOON");

//COMPUTED VARIABLES
let planetDescription = computed(() => {
  switch (actualPlanet.value) {
    case "MOON":
        return props.json[0].description;
    case "MARS":
        return props.json[1].description;
    case "EUROPA":
        return props.json[2].description;
    case "TITAN":
        return props.json[3].description;
    default:
        return props.json[0].description;
  }
})
let planetDistance = computed(() => {
  switch (actualPlanet.value) {
    case "MOON":
        return props.json[0].distance.toUpperCase();
    case "MARS":
        return props.json[1].distance.toUpperCase();
    case "EUROPA":
        return props.json[2].distance.toUpperCase();
    case "TITAN":
        return props.json[3].distance.toUpperCase();
    default:
        return props.json[0].distance.toUpperCase();
  }
})
let planetTravelTime = computed(() => {
  switch (actualPlanet.value) {
    case "MOON":
        return props.json[0].travel.toUpperCase();
    case "MARS":
        return props.json[1].travel.toUpperCase();
    case "EUROPA":
        return props.json[2].travel.toUpperCase();
    case "TITAN":
        return props.json[3].travel.toUpperCase();
    default:
        return props.json[0].travel.toUpperCase();
  }
})
let imageSource = computed(() => {
  switch (actualPlanet.value) {
    case "MOON":
        return require("../assets/destination/image-moon.webp");
    case "MARS":
        return require("../assets/destination/image-mars.webp");
    case "EUROPA":
        return require("../assets/destination/image-europa.webp");
    case "TITAN":
        return require("../assets/destination/image-titan.webp");
    default:
        return require("../assets/destination/image-moon.webp");
  }
})
let buttonStyleMoon = computed(() => {
    if (actualPlanet.value == "MOON") {
        return ".planet-button current-planet";
    } else {
        return ".planet-button";
    }
})
let buttonStyleMars = computed(() => {
    if (actualPlanet.value == "MARS") {
        return ".planet-button current-planet";
    } else {
        return ".planet-button";
    }
})
let buttonStyleEuropa = computed(() => {
    if (actualPlanet.value == "EUROPA") {
        return ".planet-button current-planet";
    } else {
        return ".planet-button";
    }
})
let buttonStyleTitan = computed(() => {
    if (actualPlanet.value == "TITAN") {
        return ".planet-button current-planet";
    } else {
        return ".planet-button";
    }
})

//FUNCTIONS
function changeToMoon() {
    actualPlanet.value = "MOON";
}
function changeToMars() {
    actualPlanet.value = "MARS";
}
function changeToEuropa() {
    actualPlanet.value = "EUROPA";
}
function changeToTitan() {
    actualPlanet.value = "TITAN";
}
</script>


<style scoped>
.pick-destination-container {
    height: 84vh;
    width: 100vw;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: absolute;
    bottom: 20px;
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
.destination-card-container {
    width: 70%;
    height: 90%;
    display: flex;
    flex-direction: column;
}
.intro-title {
    font-family: var(--barlow-condensed-regular);
    font-size: var(--heading5);
    color: var(--letter-color3);
    letter-spacing: var(--heading5-letter-space);
}
.intro-title span {
    opacity: 0.25;
    margin: 0 15px 0 0; 
}
.planet-card-container {
    box-sizing: border-box;
    width: 100%;
    height: auto;
    display: flex;
    justify-content: space-between;
    padding: 0 54px 0 40px;
}
.picture-container {
    display: flex;
    justify-content: center;
    align-items: center;
}
.picture-planet {
    width: 350px;
    height: 350px;
}
.information-container {
    width: 360px;
    height: auto;
    display: flex;
    flex-direction: column;
} 
.buttons-container {
    display: flex;
    gap: 20px;
}
.planet-button {
    display: block;
    font-family: var(--barlow-condensed-regular);
    font-size: var(--nav-text);
    letter-spacing: var(--nav-text-letter-space);
    padding: 0 0 10px 0;
    color: var(--letter-color2);
    border: none;
    background: inherit;
    cursor: pointer;
}
.current-planet {
    color: var(--letter-color3);
    border-bottom: solid var(--letter-color3);
    margin-bottom: -3px;       
}
.planet-button:hover {
    border-bottom: solid var(--letter-color3);
    margin-bottom: -3px;
}
.planet-title {
    font-size: var(--heading2);
    font-family: var(--bellefair-regular);
    margin: 15px 0 0 0;
    color: var(--letter-color3)
}
.planet-information {
    font-family: 'Barlow', sans-serif;
    font-size: 18px;
    line-height: 32px;
    text-align: justify;
    color: var(--letter-color2);
    margin: 0;
}
.details-container {
    display: flex;
    justify-content: flex-start;
    gap: 40px;
    border-top: solid 1px var(--letter-color3);
    margin: 24px 0 0 0;
    padding: 10px 0 0 0;
}
.details-inside-container {
    display: flex;
    flex-direction: column;
    gap: 12px;
}
.main-title {
    font-family: var(--barlow-condensed-regular);
    font-size: var(--subheading2);
    letter-spacing: var(--subheading2-letter-space);
    color: var(--letter-color2);
    margin: 0;
}
.description {
    font-family: var(--bellefair-regular);
    font-size: var(--heading5);
    color: var(--letter-color3);
    margin: 0;
}

@media screen and (max-width: 820px) {
    .destination-card-container {
        width: 100%;
    }
    .pick-destination-container {
        height: auto;
        position: static;
        align-items: flex-start;
        padding: 136px 0 0 0;
    }
    .intro-title {
        font-size: 20px;
        margin: 0;
        padding: 0 0 0 38.5px;
    }
    .planet-card-container {
        flex-direction: column;
        padding: 0;
    }
    .picture-container {
        margin: 60px 0 0 0;
    }
    .picture-planet {
        width: 300px;
        height: 300px;
    }
    .information-container {
        width: 573px;
        margin: 23px auto 0;
        align-items: center;
    }
    .buttons-container {
        width: 285.5px;
        justify-content: center;
        gap: 35px;
    }
    .planet-title {
        font-size: 80px;
        margin: 32px 0 0 0;
    }
    .planet-information {
        font-size: 16px;
        text-align: center;
        line-height: 28px;
        margin: 8px 0 0 0;
    }
    .details-container {
        position: absolute;
        top: 872px;
        width: 573px;
        justify-content: center;
        gap: 70px;
        margin: 0;
        padding: 28px 0 0 0;
        border-top: solid 1px #383B4B;
    }
    .details-inside-container {
        align-items: center;
    }
}

@media screen and (max-width: 415px) {
    .pick-destination-container {
        padding: 88px 0 0 0;
    }
    .destination-card-container {
        gap: 0;
    }
    .intro-title {
        padding: 0;
        text-align: center;
        font-size: var(--nav-text);
        letter-spacing: var(--nav-text-letter-space);
    }
    .picture-container {
        margin: 26px 0 0 0;
    }
    .picture-planet {
        width: 170px;
        height: 170px;
    }
    .information-container {
        width: 100%;
        margin: 26px auto 0;
    }
    .buttons-container {
        gap: 26px;
    }
    .planet-button {
        font-size: 14px;
    }
    .planet-title {
        margin: 20px 0 0 0;
        font-size: 56px;
        line-height: 64.18px;
    }
    .planet-information-container{
        width: 327px;
        height: 128px;
    }
    .planet-information {
        width: 327px;
        font-size: 15px;
        line-height: 25px;
    }
    .details-container {
        height: 154px;
        flex-direction: column;
        top: 580px;
        gap: 32px;
        margin: 32px 0 28px 0;
        padding: 32px 0 0 0;
        width: 327px;
        position: static;
    }
    
}

@media screen and (min-width: 1440px) {
    .destination-card-container {
        width: 75%;
        height:85%;
        gap: 64px;
    }
    .picture-container{
        padding: 33px 0 0 0;
    }
    .picture-planet {
        width: 445px;
        height: 445px;
    }
    .planet-card-container {
        justify-content: center;
        gap: 157px;
        padding: 0 54px 0 60px;      
    }
    .planet-title {
        margin: 37px 0 0 0;
    }
    .planet-information {
        width: 444px;
        margin: 14px 0 0 0;
    }
    .details-container {
        width: 444px;
        gap: 79px;
        padding: 28px 0 0 0;
        position: absolute;
        bottom: 118px; 
    }
}

</style>
