<template>
  <div>
    <span class="modal_span" @click="isShow = !isShow">機能説明</span>

    <transition>
      <div v-show="isShow">
        <div class="modal__inner">
          <div class="modal__close" @click="isShow = !isShow"><i class="fas fa-times"></i>
            <ul>
              <li>
                <i class="far fa-address-book"></i>
                <span class="span">会員登録</span>
                <p>登録することで、各種機能をつかえるようになります。投稿記事の閲覧は会員登録の必要なく行うことができます。</P>
              </li>  
              <li>
                <i class="far fa-paper-plane"></i>
                <span class="span">投稿機能</span>
                <p>会員登録することで自由に投稿することができます。</p>
              </li>
              <li>
                <i class="far fa-star"></i>
                <span class="span">口コミ投稿機能</span>
                <p>PCパーツの感想を投稿できます。</p>
              </li>
              <li>
                <span class="span">マイページ機能</span>
                <p>ユーザーが投稿したアイテム一覧を確認することができます。</p>
              </li>    
              <li>
                <span class="span">ログイン機能</span>
                <p>登録したユーザーやゲストログインでログインできます。ホーム画面からもゲストログインでログインすることができます。</p>
              </li>
              <li>
                <span class="span">商品名検索機能</span>
                <p>投稿時に記入したタイトル名で検索できます。</p>
              </li>
              <li>
                <span class="span">カテゴリー検索機能</span>
                <p>投稿時に選択肢したカテゴリーで検索できます。</p>
              </li>
              <li>
                <span class="span">アイテム・口コミ更新・削除機能</span>
                <p>投稿したアイテムや口コミを更新・削除ができます。</p>
              </li>
            </ul>      
          </div>
        </div>
        <div class="modal__background" @click="isShow = !isShow"></div>
      </div>
    </transition>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        isShow: false
      }
    }
  }
</script>