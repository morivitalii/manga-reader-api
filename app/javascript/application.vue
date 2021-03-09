<template>
  <div id="app">
    <div v-for="message in messages">
      <p>{{ message }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      messages: ["Hello Vue!", "Fuck yeah!"]
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