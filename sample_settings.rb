# frozen_string_literal: true

Plugin.create(:sample_settings) do
  settings('設定サンプル') do
    #
    # settings の中に settingを入れ子にすることでグルーピングが可能
    #
    settings('input') do
      input('一行入力欄', :sample_settings_input)

      inputpass('パスワード欄', :sample_settings_inputpass)

      settings('multi') do
        multi('複数テキスト', :sample_settings_multi)
        multitext('複数行のテキスト', :sample_settings_multitext)
      end
    end

    settings('select系') do
      hash = { 0 => '上', 1 => '下', 2 => '左', 3 => '右' }

      select('ドロップダウン', :sample_settings_select_dropdown, hash)

      #
      # ラジオボタンにするにはブロック内でブロックを持つオプションが存在する必要がある
      #
      select('ラジオボタン', :sample_settings_select_radio) do
        option(:foo, 'オプション1') do
          #
          # tooltip をチェインすることでその項目に説明を追加できる
          # ホバーすることで表示される
          #
          input('オプションブロック', :opt1)
            .tooltip('ブロックを渡すことでラジオボタンになる')
        end
        option(:bar, 'オプション2')
      end

      #
      # ブロックを持つオプションがないと動かない
      #
      multiselect '複数セレクト', :sample_settings_multiselect do
        option(:opt1, _('ヘッダを表示する')) do
          select('複数セレクト内オプション', :opt1_select, hash)
        end
        option(:opt2, _('アイコンを表示する'))
        option(:opt3, _('枠線を表示する'))
      end

      #
      # ファイル取得はパスの指定もできる
      # パスの指定がない場合は読み込んでいるコンフィグのルートに設定される
      #
      fileselect('ファイルの取得', :sample_settings_fileselect)
      fileselect('ファイルの取得（パス指定あり）', :sample_settings_fileselect, '/')
    end

    adjustment('数値指定', :UserConfigのキー, 0, 100)

    boolean('チェックボックス', :sample_settings_boolean)

    color('色設定', :sample_settings_color)

    fontcolor('フォント色', :sample_settings_fontcolor_font, :sample_settings_fontcolor_color)

    about('sample settingsについて',
          program_name: 'sample settings',
          copyright: '2018 ahiru',
          version: '1.0.0',
          comments: 'mikutter settingのサンプルプログラム',
          license: (open('./LICENSE', 'rb:utf-8', &:read) rescue nil),
          website: 'https://github.com/Na0ki/mikutter_sample_settings.git',
          logo: '/skin/close.png',
          authors: %w[ahiru3net],
          artists: %w[ahiru3net],
          documenters: %w[ahiru3net])
  end
end
