<template>
<div>
  <div class="supllement-item">
    <input class="acd-check" id="supplementId" type="checkbox">
      <div class="supplement-item__inner">
        <label class="acd-label" for="supplementId">
          <div class="item-low">
            <div class="supplement-name">{{supplementName}}</div>
            <div class="supplement-info">
              <div v-if="supplementType === 'tablet'">
                {{ 残り : ${supplementcontentsize} (錠) }}
              </div>
              <div v-else>
                {{ 残り : ${supplementcontentsize} (g) }}
              </div>
            </div>
          </div>
        </label>
        <div class="acd-content">
          <div class="item-rows">
            <div class="item-row">
              <div class="supplement-info">{{ なくなる日: ${supplementEmptyDate} }}</div>
            </div>
            <div class="item-row">
              <div class="supplement-info">
                <div v-if="supplementRemindDate === null">
                  {{ リマインド: #{supplementRemind} div> }}
                </div>
                <div v-else>
                  {{リマインド: ${supplementRemind} (${supplementRemindDate) }}
                </div>
              </div>
            </div>
            <div class="item-row">
              <div class="supplement-info">
                {{ 1日の摂取量: ${supplement.daily_intake} }}
                <div v-if="supplementType === 'tablet'">(錠)</div>
                <div v-else>(g) </div>
              </div>
            </div>
          </div>
          <div class="supplement-btns">
            <div class="btn-supplement-edit-item">
            </div>
            <div class="btn-supplement-destroy-item">
            </div>
          </div>
        </div>
      </div>
    </input>
  </div>
</div>
</template>

<script>
export default {
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
