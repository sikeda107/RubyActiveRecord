require 'rubygems'
require 'active_record'
require_relative './model/Animal'

class Main
  def initialize
    @name = 'mainだよ'
    # DB接続設定
    @config = YAML.load_file('./database.yml')
    ActiveRecord::Base.establish_connection(@config['db']['development'])
  end

  attr_reader :name

  def raiseEx
    raise '例外発生!!'
  end

  def run
    # レコード取得
    p Animal.all
    begin
      ActiveRecord::Base.transaction do # BEGIN
        # SELECT ... FOR UPDATE
        # 前に実行中のトランザクションがあればロック解除待ち、
        # なければクエリー実行
        animal = Animal.lock.find(1)
        p animal
        # animal.name = 'dog2'
        animal.name = nil
        animal.save!
        raiseEx
        animal.name = 'dog3'
        animal.save!
        p animal
      end
    rescue StandardError => e
      p 'レスキュー'
      p Animal.all
      p e
    end
  end
end

# main = Main.new
# main.run
