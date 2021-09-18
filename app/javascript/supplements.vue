<template>
  <div>
    <div class="page-header">
      <div class="container">
        <h1 class="page-header__title">サプリメントリスト</h1>
      </div>
    </div>
    <div class="main-items">
      <div class="container">
        <div v-if="isFirstVisit">
          <section class="welcome-content is-centered">
            <strong class="welcome-sentence">ご登録ありがとうございます！</strong>
            <p class="welcome-sentence">さっそくサプリメントを登録してみましょう！</p>
            <p class="welcome-sentence">「サプリメント追加」を押してください！</p>
          </section>
        </div>
        <div>
          <div v-if="!isFirstVisit && supplements.length === 0" class="supplements-empty is-centered">
            <i class="far fa-flushed fa-4x"></i>
            <div class="empty-sentence is-centered"> サプリメントは登録されていません！</div>
          </div>
        </div>
        <div>
          <div class="supplement-items">
            <supplement v-for="supplement in supplements" :supplement="supplement" :key="supplement.id"></supplement>
          </div>
        </div>
      </div>
      <div class="btn-position-add">
        <a class="btn btn-supplement-add" :href='`/supplements/new`'>
          <i class="fas fa-plus"></i>
          <div class="add-btn-items">追加</div>
        </a>
      </div>
    </div>
  </div>
</div>
</template>

<script>
  import axios from 'axios'
  import Supplement from './supplement.vue'

  export default {
    components: {
     Supplement: Supplement
    },
    data() {
      return {
        supplements: "",
      }
    },
    mounted() {
      axios
        .get('/api/supplements.json')
        .then(response => (this.supplements = response.data))
    },
    methods: {
    },
    computed: {
      isFirstVisit() {
        const elements = document.getElementsByClassName('alert')
        if (elements.length > 0) {
          return elements[0].textContent === 'アカウント登録が完了しました。'
        } else {
          return false
        }
      },
    },
  }
</script>
