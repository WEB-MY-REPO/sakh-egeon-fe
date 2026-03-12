<template>
    <v-parallax :src="`/pictures/work${Math.round(Math.random() * 4 + 1)}.jpg`" height="100%">
        <div class="d-flex justify-center">
            <v-card class="cardColor ma-1 ma-sm-8 px-2 px-sm-12">
                <div class="text-h6 text-lg-h3 text-center mt-8 font-weight-black"><span v-html="work.title"></span>
                </div>
                <div class="text-body-1 text-lg-h4 ma-lg-14 font-weight-black">
                    <div v-html="work.text"></div>
                </div>
                <div v-for="(img, idx) in work.pictures" :key="idx" class="d-flex justify-center my-2 my-sm-12">
                    <img :src="`/pictures/works/${img}`" :style="$isMobile ? 'min-width:100%' : 'min-width:75%'" />
                </div>
            </v-card>
        </div>
    </v-parallax>
</template>

<script>
export default {
    name: "Works",
};
</script>

<script setup>
import { ref, onMounted, inject } from "vue";
import { useRoute } from "vue-router";

//--Pure constants--
const route = useRoute();

//--Reactive constatns--
const work = ref({});
const ourworkstexts = inject("ourworkstexts");

//--Hooks--
onMounted(() => {
    for (let i = 0; i < ourworkstexts.value.length; ++i) {
        const index = ourworkstexts.value[i].findIndex(x => x.id == route.query.work);
        if (index > -1) {            
            work.value = ourworkstexts.value[i][index];
            break;
        }
    }
});
</script>