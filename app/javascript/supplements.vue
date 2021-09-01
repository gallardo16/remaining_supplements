<template>
<div>
  <div class="page-header">
    <div class="container">
      <h1 class="page-header__title">サプリメントリスト</h1>
    </div>
  </div>
  <div class="main-items">
    <div class="container">
      <div v-if="isFirstVisit" >
        <section class="welcome-content is-centered">
          <strong class="welcome-sentence">ご登録ありがとうございます！</strong>
          <p class="welcome-sentence">さっそくサプリメントを登録してみましょう！</p>
          <p class="welcome-sentence">「サプリメント追加」を押してください！</p>
        </section>
      </div>
      <div v-if="supplements.length === 0  && isFirstVisit">
        <div class="supplements-empty is-centered">
          <i class="far fa-flushed fa-4x"> </i>
          <div class="empty-sentence is-centered"> サプリメントは登録されていません！</div>
        </div>
      </div>
      <div v-if="supplements.length > 0">
        <div class="supplement-items">
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios';
//import supplement from './supplement.vue'

export default {
//  components: {
//   'supplement': supplement,
//  },
  data: function () {
    return {
      supplements: []
    }
  },
  mounted () {
    axios
      .get('/api/supplements.json')
      .then(response => (this.supplements = response.data))
  },
  computed: {
    isFirstVisit() {
      const flashItem = document.getElementsByClassName('alert-success').textContent
      return flashItem === 'アカウント登録が完了しました。'
    },
  },
}
</script>
