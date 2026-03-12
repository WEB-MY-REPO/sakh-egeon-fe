<template>
    <v-app>
        <Header :height="headerHeight"></Header>
        <v-main>
            <div v-if="loaded.some(x => x == false)" class="loader-wrapper">
                <v-progress-circular indeterminate size="x-large"></v-progress-circular>
            </div>
            <router-view v-else></router-view>
        </v-main>
    </v-app>
</template>

<script setup>
import app from "@/main";
import { ref, provide, onMounted } from "vue";
import { useDisplay, useTheme } from "vuetify";
import { ajaxGetStatic } from "@/ajax";

//--Components--
import Header from "@/components/pages/Header.vue";

//--Common constants--
const { mobile } = useDisplay();
app.config.globalProperties.$isMobile = mobile.value;
provide("mobile", mobile);
const headerHeight = 124;

//--Reactive constants--
const organization = ref([]);
provide("organization", organization);
const works = ref([]);
provide("works", works);
const ourworkstexts = ref([]);
provide("ourworkstexts", ourworkstexts);
const loaded = ref([false, false, false]);

//--Hooks--
onMounted(() => {
    ajaxGetStatic("/organization.json", (response) => {
        organization.value = response.data;
        loaded.value[0] = true;
    });

    ajaxGetStatic("/ourworks.json", (response) => {
        works.value = response.data;
        loaded.value[1] = true;
    });

    ajaxGetStatic("/ourworkstexts.json", (response) => {
        ourworkstexts.value = response.data;
        loaded.value[2] = true;
    });
});
</script>

<style>
p,
ul {
    line-height: 1.75;
}

.loader-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 124px);
}

.pointer {
    cursor: pointer;
}

.hover1:hover {
    color: black;
}

.hover2:hover {
    color: white;
}

.hovershd:hover {
    text-shadow: 3px 3px 2px black;
}

.hovershd1:hover {
    text-shadow: 2px 2px 2px black;
}

.hovershd2:hover {
    text-shadow: 1px 1px 1px black;
}

.wsspan {
    color: black;
    text-shadow: 1px 1px 6px grey;
    /*color: white;
    text-shadow: 2px 2px 3px black;*/
}

.wsspanw {
    color: white;
    text-shadow: 2px 2px 3px black;
}

.textshadow {
    text-shadow: 1px 1px 2px black;
}

.cardColor {
    /* background-color: rgba(200, 200, 200, 0.5) !important; */
    background-color: rgba(255, 255, 255, 0.9) !important;
    border-color: white !important;
}

.bigchip {
    height: auto;
    min-height: 72px;
    white-space: pre-wrap;
    background-color: gray;
    border-radius: 15px;
    border-width: 2px;
}

/* .v-img__img--cover:has(< .v-parallax) {
    filter: v-bind(router.currentRoute.value.path == "/" ? null : 'blur(3px)');
    opacity: v-bind(router.currentRoute.value.path == "/" ? null : '0.2');
} */
.v-parallax>.v-img__img--cover {
    filter: blur(3px);
    opacity: 0.25;
}
</style>