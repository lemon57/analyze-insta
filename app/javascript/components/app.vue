<!-- <template>

  <div id="app">
    <p>{{ message }}</p>
  </div>

</template> -->

<template>
<v-app>
   <div id="app">
    <p>{{ message }}</p>
  </div>
  <div>
    <v-btn color="success">Success</v-btn>
    <v-btn color="error">Error</v-btn>
    <v-btn color="warning">Warning</v-btn>
    <v-btn color="info">Info</v-btn>
  </div>
</v-app>
</template>


<script>
export default {
  data: function () {
    return {
      message: new Date
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
