<template>
  <!-- HOME PAGE -->
  <div v-if="actualPosition == 'home'" class="main-page-container">
    <NavBar :value="actualPosition" @change-page="changeActualPage"/>
    <section class="main-info-container">
      <div class="text-container">
        <p class="first-text">SO, YOU WANT TO TRAVEL TO</p>
        <p class="title">SPACE</p>
        <p class="second-text">Let’s face it; if you want to go to space, you might as well genuinely go to outer space and not hover kind of on the edge of it. Well sit back, and relax because we’ll give you a truly out of this world experience!</p>
      </div>
      <div class="explore-button-container">
        <button class="explore-button" @click="changeToDestination">EXPLORE</button>
      </div>
    </section>
  </div>

  <!-- DESTINATION PAGE -->
  <div v-if="actualPosition == 'destination'" class="destination-page-container">
    <NavBar :value="actualPosition" @change-page="changeActualPage"/>
    <PickDestination :json="destinationData"/>
    
  </div>

  <!-- CREW PAGE -->
  <div v-if="actualPosition == 'crew'" class="crew-page-container">
    <CrewStaff :json="crewData" class="crew-staff"/>
    <NavBar :value="actualPosition" @change-page="changeActualPage" class="crew-navbar"/>
  </div>

  <!-- TECHNOLOGY PAGE -->
  <div v-if="actualPosition == 'technology'" class="technology-page-container">
    <SpaceLaunch :json="techData"/>
    <NavBar :value="actualPosition" @change-page="changeActualPage"/>
  </div>
</template>




<script setup>
import { ref } from '@vue/reactivity';
import NavBar from './components/NavBar.vue';
import PickDestination from './components/PickDestination.vue';
import CrewStaff from './components/CrewStaff.vue';
import SpaceLaunch from './components/SpaceLaunch.vue';

let actualPosition = ref("home");

const jsonURL = require("./assets/data.json");
const destinationData = jsonURL.destinations;
const crewData = jsonURL.crew;
const techData = jsonURL.technology;
//FUNCTIONS
function changeActualPage(newPage) {
  actualPosition.value = newPage;
}
function changeToDestination() {
  actualPosition.value = "destination";
}


</script>





<style>
@import url('https://fonts.googleapis.com/css2?family=Bellefair&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Barlow&display=swap');
#app {
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  /* COLORS */
  --letter-color1: #0B0D17;  
  --letter-color2: #D0D6F9;  
  --letter-color3: #FFFFFF;
  /* TYPOGRAPHY */
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
body {
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}


/* MAIN PAGE STYLES */
.main-page-container {
  width: 100%;
  height: 100%;
  background-image: url("./assets/home/background-home-desktop.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
.main-info-container {
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: space-between;
  padding: 0 165px;
}
.text-container {
  width: 30vw;
  height: auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  /* margin: 0 0 0 145px; */
}
.first-text {
  font-family: var(--barlow-condensed-regular);
  font-size: var(--heading5);
  color: var(--letter-color2);
  letter-spacing: var(--heading5-letter-space);
  margin: 120px 0 0 0;
}
.title {
  font-family: var(--bellefair-regular);
  font-size: var(--heading1);
  color: var(--letter-color3);
  margin: 20px 0 20px 0;
}
.second-text {
  font-family: 'Barlow', sans-serif;
  font-size: 18px;
  line-height: 32px;
  text-align: justify;
  color: var(--letter-color2);
  margin: 0;
}
.explore-button-container {
  width: auto;
  height: auto;
}
.explore-button {
  width: 250px;
  height: 250px;
  margin: 300px 0 0 0;
  background-color: var(--letter-color3);
  border-radius: 50%;
  border: none;
  font-size: var(--heading4);
  font-family: var(--bellefair-regular);
  cursor: pointer;
  transition: 0.8s;
  opacity: 0.8;
}
.explore-button:hover {
  outline: solid 50px #979797;  
  opacity: 1;
}





/* DESTINATION PAGE STYLES */
.destination-page-container {
  width: 100%;
  height: 100%;
  background-image: url("./assets/destination/background-destination-desktop.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}





/* CREW PAGE STYLES */
.crew-page-container {
  width: 100%;
  height: 100%;
  background-image: url("./assets/crew/background-crew-desktop.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;  
}





/* TECHNOLOGY PAGE STYLES */
.technology-page-container {
  width: 100%;
  height: 100%;
  background-image: url("./assets/technology/background-technology-desktop.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  z-index: 1;   
}

@media screen and (max-width: 820px) {
  .main-page-container {
    background-image: url(./assets/home/background-home-tablet.jpg);
  }
  .destination-page-container {
    background-image: url(./assets/destination/background-destination-tablet.jpg);
  }
  .main-info-container {
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    gap: 156px;
    padding: 0;
  }
  .text-container {
    width: 450px;
    margin: 202px 0 0 0;
    align-items: center;
  }
  .first-text {
    font-size: 20px;
    margin: 0;
  }
  .title {
    margin: 24px 0 0 0;
  }
  .second-text {
    font-size: 16px;
    text-align: center;
    line-height: 28px;
    margin: 24px 0 0 0;
  }
  .explore-button-container {
    margin: 0 auto;
  }
  .explore-button {
    width: 242px;
    height: 242px;
    margin: 0;
    opacity: 1;
  }  
}

@media screen and (max-width: 415px) {
  .main-page-container {
    background-image: url("./assets/home/background-home-mobile.jpg")
  }
  .destination-page-container {
    background-image: url("./assets/destination/background-destination-mobile.jpg");
    height: 825px;
  }
  .crew-page-container {
    background-image: url("./assets/crew/background-crew-mobile.jpg");
  }
  .technology-page-container {
    background-image: url("./assets/technology/background-technology-mobile.jpg");
  }
  .main-info-container {
    gap: 81px;
  }
  .text-container {
    width: 100%;
    margin: 112px 0 0 0;
  }
  .first-text {
    font-size: var(--nav-text);
    letter-spacing: var(--nav-text-letter-space);
  }
  .title {
    margin: 16px 0 0 0;
    font-size: 80px;
    line-height: 100px;
  }
  .second-text {
    margin: 16px 0 0 0;
    font-size: 15px;
    width: 327px;
  }
  .explore-button {
    width: 150px;
    height: 150px;
    font-size: 20px;
    line-height: 22.92px;
    letter-spacing: 1.25px;
  }    
}

@media screen and (min-width: 1440px) {
  .text-container {
    width: 27vw;
  }
  .first-text {
    margin: 251px 0 0 0;
  }
  .title {
    margin: 24px 0 24px 0;
  }
  .second-text {
    width: 444px;
  }
  .explore-button {
    width: 274px;
    height: 274px;
    margin: 495px 0 0 0;    
  }  
}
</style>
