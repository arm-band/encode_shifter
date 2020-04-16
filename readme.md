# Encode Shifter

## Abstract

`src`ディレクトリ以下のファイルの文字コードをShift-JISからUTF-8(BOMなし)に変換して`dist`に出力するコードスニペット。

## Using

1. プロジェクトは以下まで移動
2. `src`ディレクトリに変換したいファイル群を配置(階層のネスト可)
3. `PowerShell .\encodeShifter.ps1`
    - PowerShellの実行が制限されている環境では`PowerShell -ExecutionPolicy RemoteSigned .\encodeShifter.ps1`という形で実行してください
4. エディタで各種指定を一括置換してください
    - `<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />`
        - `<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />`
    - `@charset "shift_jis";`
        - `@charset "utf-8";`
    - `charset=Shift_JIS`
        - `charset=UTF-8`

## Notice

変換対象の拡張子は以下の通りです。

- `.html`
- `.htm`
- `.js`
- `.css`
- `.pl`
- `.cgi`
- `.php`
- `.twig`
