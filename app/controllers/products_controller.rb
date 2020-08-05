class ProductsController < RankingController
    before_action :authenticate_user!, only: :search

  def index
    @products = Product.order('id Asc').limit(20)
  end

  def show
    # productsテーブルから該当するidの作品情報を取得し@productの変数へ代入する処理を書いて下さい
    @product = Product.find(params[:id])
 # 問題3ではこのコードは消して新しくコードを書いてください
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
    @products = []
  end
end
