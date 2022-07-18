<template>
<div class="general-container">
  <header class="header-container">
    <picture class="picture-container">
      <img src="../assets/shared/logo.svg" alt="">
    </picture>
    <div class="rectangule-container">
      <div class="rectangule"></div>
    </div>

    <Transition name="fade">
      <div v-if="menuOpen" class="mobile-menu-container">
        <div>
          <img class="mobile-close-icon" src="../assets/shared/icon-close.svg" alt="" @click="closeMobileMenu">
        </div>
        <div class="mobile-buttons-container">
          <button class="mobile-nav-button" @click="clickHome"><b>00</b> HOME</button>
          <button class="mobile-nav-button" @click="clickDestination"><b>01</b> DESTINATION</button>
          <button class="mobile-nav-button" @click="clickCrew"><b>02</b> CREW</button>
          <button class="mobile-nav-button" @click="clickTechnology"><b>03</b> TECHNOLOGY</button>
        </div>
      </div>
    </Transition>

    <nav class="nav-bar-container" :class="dynamicMenu">
      <img  class="hamburguer-menu" src="../assets/shared/icon-hamburger.svg" alt="" @click="openMobileMenu">
      <div class="background-nav"></div>
      <div class="buttons-container">
        <button class="nav-button" :class="buttonStyleHome" @click="clickHome"><b>00</b> HOME</button>
        <button class="nav-button" :class="buttonStyleDestination" @click="clickDestination"><b>01</b> DESTINATION</button>
        <button class="nav-button" :class="buttonStyleHomeCrew" @click="clickCrew"><b>02</b> CREW</button>
        <button class="nav-button" :class="buttonStyleHomeTechnology" @click="clickTechnology"><b>03</b> TECHNOLOGY</button>
      </div>
    </nav>
  </header>
</div>
</template>



<script setup>
import { defineProps, computed, defineEmits, ref } from 'vue'


//PROPS
const props = defineProps({
  value: String
}) 

//VARIABLES
let menuOpen = ref(false);

//EMITS
const emit = defineEmits(['changePage']);

//COMPUTED VARIABLES
let buttonStyleHome = computed(() => {
  if (props.value == "home") {
    return ".nav-button active";
  } else {
    return ".nav-button"
  }
})

let buttonStyleDestination = computed(() => {
  if (props.value == "destination") {
    return ".nav-button active";
  } else {
    return ".nav-button"
  }
})

let buttonStyleHomeCrew = computed(() => {
  if (props.value == "crew") {
    return ".nav-button active";
  } else {
    return ".nav-button"
  }
})

let buttonStyleHomeTechnology = computed(() => {
  if (props.value == "technology") {
    return ".nav-button active";
  } else {
    return ".nav-button"
  }
})
let dynamicMenu = computed(() => {
  if(menuOpen.value) {
    return ".nav-bar-container menu-no-active";
  } else {
    return ".nav-bar-container"
  }
})

//FUNCTIONS
function clickHome() {
  emit("changePage","home");
}
function clickDestination() {
  emit("changePage","destination");
}
function clickCrew() {
  emit("changePage","crew");
}
function clickTechnology() {
  emit("changePage","technology");
}
function openMobileMenu() {
  menuOpen.value = true;
}
function closeMobileMenu() {
  menuOpen.value = false;
}

</script>



<style scoped>

.general-container {
  box-sizing: border-box;
  height: 16vh;
  width: 100vw;
  position: absolute;
  top: 0;
  padding: 4.5vh 0 0 4.5vw;
  --barlow-condensed-regular: 'Barlow Condensed', sans-serif;
  --nav-text: 16px;
  --nav-text-letter-space: 2.7px;
  --letter-color2: #D0D6F9;
  --letter-color3: #FFFFFF;
}
.header-container {
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
}
.picture-container {
  width: 8%;
}
.rectangule-container {
  width: 32%;
  z-index: 2;
}
.rectangule {
  height: 1px;
  width: 450px;
  background-color: #979797;
}
.nav-bar-container {
  position: relative;
  width: 830px;
  height: 100%;
  display: flex;
  justify-content: center;
  gap: 48px;
  z-index: 1;
}
.hamburguer-menu {
  display: none;
}
.menu-no-active {
  display: none;
}
.background-nav {
  width: 100%;
  height: 100%;
  position: absolute;
  background-color: rgba(255, 255, 255,0.04);
  opacity: 0.96;
  backdrop-filter: blur(81.5px);
  z-index: 0;  
}
.buttons-container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  gap: 48px;
  position: absolute;
}
.nav-button {
  font-family: var(--barlow-condensed-regular);
  font-size: 16px;
  letter-spacing: 2.7px;
  color: var(--letter-color3);
  background: none;
  border: none;
  padding: 0;
  cursor: pointer;
  z-index: 1;
}
.nav-button:hover {
  border-bottom: solid var(--letter-color3);
  margin-bottom: -3px;
}
.active {
  border-bottom: solid 3px var(--letter-color3);
  margin-bottom: -3px;
}


@media screen and (max-width: 820px) {
  .general-container {
    height: 96px;
    padding: 0 0 0 4.5vw;
  }
  .rectangule {
    display: none;
  }
  .nav-bar-container {
    width: 450px;
    gap: 37px;
  }
  .buttons-container {
    gap: 37px;
    width: 356px;
  }
  .nav-button {
    font-size: 14px;
  }
  .nav-button b {
    display: none;
  }  
}
@media screen and (max-width: 415px) {
  .mobile-menu-container {
    position: absolute;
    width: 254px;
    height: 100vh;
    top: 0;
    left: 121px;
    background-color: rgba(255, 255, 255,0.04);
    backdrop-filter: blur(30px);
  }
  .mobile-close-icon {
    width: 19px;
    height: 19px;
    position: absolute;
    top: 33.95px;
    right: 26.45px;
  }
  .mobile-buttons-container {
    width: 190px;
    height: 172px;
    margin: 118px auto 0;
    display: flex;
    justify-content: space-between;
    flex-direction: column;
  }
  .mobile-nav-button {
    font-family: var(--barlow-condensed-regular);
    font-size: 16px;
    letter-spacing: 2.7px;
    line-height: 19.2px;
    color: var(--letter-color3);
    text-align: start;
    background: none;
    border: none;
    padding: 0;
  }
  .mobile-nav-button b {
    font-weight: 700;
  }
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s ease; 
  }
  .fade-enter-from, .fade-leave-to {
    opacity: 0;
  }

  .general-container {
    padding: 0 24px;
  }
  .header-container {
    height: auto;
    justify-content: space-between;
    margin: 24px 0 0 0;
  }
  .nav-bar-container {
    width: 24px;
    height: 21px;
  }
  .hamburguer-menu {
    display: block;
  }
  .background-nav {
    display: none;
  }
  .buttons-container, .nav-button {
    display: none;
  }
  .picture-container img{
    width: 40px;
    height: 40px;
  }  
}

@media screen and (min-width: 1440px) {
  .general-container {
    padding: 4.44vh 0 0 3.47vw;
  }
  .rectangule {
    width: 473px;
    position: absolute;
    left: 167px;
  }
  .nav-bar-container {
    gap: 48px;
  }
  .nav-button {
    font-size: var(--nav-text);
    letter-spacing: var(--nav-text-letter-space);
  }
}
</style>
