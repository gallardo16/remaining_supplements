<template>
  <div class="js-accordion" v-cloak>
    <div>
      <button class="js-accordion--trigger" type="button" :class="{ '_state-open': isOpened }" @click="accordionToggle()">
        <div class="item-low">
          <div class="supplement-name">{{ supplement.name }}</div>
          <div class="supplement-info">
            <div>残り : {{ supplement.content_size }}{{ supplementType }}</div>
          </div>
        </div>
      </button>
    </div>
    <div class="js-accordion--target" :class="{ '_state-open': isOpened }" v-if="isOpened">
      <div class="item-rows">
        <div class="item-row">
          <div class="supplement-info">なくなる日: {{ emptyDate }} </div>
        </div>
        <div class="item-row">
          <div class="supplement-info">
            <div>リマインド: {{ supplement.remind }}</div>
          </div>
        </div>
        <div class="item-row">
          <div class="supplement-info">1日の摂取量: {{ supplement.daily_intake }}{{ supplementType }}</div>
        </div>
      </div>
      <div class="supplement-btns">
        <div class="btn-supplement-edit-item">
          <a  class="btn btn-supplement-edit" :href='`/supplements/${supplement.id}/edit`'>内容変更</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    supplement: { type: Object, required: true },
  },
  data() {
    return {
      isOpened: false
    }
  },
  methods: {
    accordionToggle: function(){
      this.isOpened = !this.isOpened;
    },
  },
  computed: {
    supplementType() {
      if (this.supplement.supplement_type === "tablet") {
        return "(錠)"
      } else {
        return "(g)"
      }
    },
    emptyDate() {
      const created_dt = new Date(this.supplement.created_at)
      const empty_dt =  new Date(created_dt.setDate(created_dt.getDate() + this.supplement.content_size / this.supplement.daily_intake))
      return empty_dt.getFullYear() + '/' + ('0' + (empty_dt.getMonth() + 1)).slice(-2) + '/' + ('0' + empty_dt.getDate()).slice(-2)
    },
  },
}
</script>
