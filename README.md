# Neovim Configuration Cheat Sheet

## 基本操作

### キーマップ
| キー | 機能 | 説明 |
|-----|------|------|
| `<Space>` | Leader キー | 多くのコマンドのプレフィックス |
| `jk` | ESC | インサートモードから抜ける |
| `x` | Delete without copy | 文字削除（ヤンクしない） |
| `<Esc><Esc>` | Clear highlights | 検索ハイライトをクリア |

## ファイル検索・操作 (Telescope)

| キー | 機能 | 説明 |
|-----|------|------|
| `<leader>ff` | Find files | ファイル検索 |
| `<leader>fg` | Live grep | 文字列検索 |
| `<leader>fb` | Buffers | バッファ一覧 |
| `<leader>fh` | Help tags | ヘルプ検索 |

### Telescope 内の操作
- `<C-n>` / `<C-p>`: 上下移動
- `<CR>`: 選択
- `<C-c>`: キャンセル

## 文字入力・編集

### 自動補完 (nvim-cmp)
| キー | 機能 |
|-----|------|
| `<C-p>` | 前の候補 |
| `<C-n>` | 次の候補 |
| `<C-l>` | 補完メニュー表示 |
| `<C-e>` | 補完中止 |
| `<CR>` | 補完確定 |
| `<Tab>` | 次の候補 / スニペット展開 |
| `<S-Tab>` | 前の候補 |

### 囲み文字操作 (nvim-surround)
| 操作 | 機能 | 例 |
|-----|------|-----|
| `ys{motion}{char}` | 囲み文字追加 | `ysiw"` → word を " で囲む |
| `ds{char}` | 囲み文字削除 | `ds"` → " を削除 |
| `cs{old}{new}` | 囲み文字変更 | `cs"'` → " を ' に変更 |

### 括弧自動補完 (nvim-autopairs)
- `(`, `{`, `[`, `"`, `'` などを入力すると自動で閉じ括弧が挿入される

## 移動・ナビゲーション

### Quick Scope (f/t 移動)
- `f`, `F`, `t`, `T` でジャンプ時に候補文字がハイライトされる
- 緑色: 最初の候補
- 黄色: 2番目の候補

## LSP・言語サポート

### 利用可能な言語
- **Lua**: lua_ls が設定済み

### LSP 機能（標準）
| キー | 機能 |
|-----|------|
| `gd` | 定義へジャンプ |
| `gr` | 参照一覧 |
| `K` | ホバー情報 |
| `<C-k>` | シグネチャヘルプ |

## GitHub Copilot

- 自動的にコード補完候補を提供
- nvim-cmp と統合済み
- 全ファイルタイプで有効

## フォーマッター (Conform)

### 対応言語
- **Lua**: stylua

### 使用方法
- 保存時に自動フォーマット実行

## 外観・UI

### カラーテーマ
- **Nightfox** を使用

### ハイライト機能
- **Rainbow Delimiters**: 括弧を色分け表示
- **Treesitter**: シンタックスハイライト

## QuickFix

- QuickFix ウィンドウで編集可能（Quicker プラグイン）

## 設定ファイル構造

```
~/.config/nvim/
├── init.lua                    # エントリーポイント
├── lua/
│   ├── core/                   # 基本設定
│   │   ├── bootstrap.lua       # lazy.nvim のブートストラップ
│   │   ├── options.lua         # Neovim オプション
│   │   └── keymaps.lua         # キーマップ
│   └── plugins/                # プラグイン設定 (1 plugin = 1 file)
│       ├── nightfox.lua        # カラーテーマ
│       ├── telescope.lua       # ファジーファインダー
│       ├── nvim-cmp.lua        # 補完エンジン
│       ├── copilot.lua         # GitHub Copilot
│       └── ...                 # その他のプラグイン
└── README.md                   # このファイル
```

## カスタマイズ

### 新しいプラグインの追加
1. `lua/plugins/` に新しい `.lua` ファイルを作成
2. プラグイン設定を記述
3. Neovim を再起動

### 既存設定の変更
- **オプション**: `lua/core/options.lua`
- **キーマップ**: `lua/core/keymaps.lua`  
- **個別プラグイン**: `lua/plugins/{plugin-name}.lua`

## トラブルシューティング

### プラグインが読み込まれない
```vim
:Lazy reload {plugin-name}
```

### LSP が動作しない
```vim
:LspInfo
```

### 設定の再読み込み
```vim
:source ~/.config/nvim/init.lua
```