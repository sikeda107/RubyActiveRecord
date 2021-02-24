# テーブルにアクセスするためのクラスを宣言
class Animal < ActiveRecord::Base
  # テーブル名が命名規則に沿わない場合、
  # self.table_name = 'wp_users'  # set_table_nameは古いから注意
end
