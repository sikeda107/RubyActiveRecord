require './spec/spec_helper'
require_relative '../main/Main'

describe Main do
  it 'Mainのインスタンス生成テストOK' do
    main = Main.new
    expect(main.name).to eq 'mainだよ'
  end
  it 'Mainのインスタンス生成テストNG' do
    main = Main.new
    expect(main.name).to eq 'mainじゃないよ'
  end
end
