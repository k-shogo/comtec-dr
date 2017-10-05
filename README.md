# ComtecDr

コムテックのドライブレコーダーの動画からGPSログデータを取り出します

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'comtec-dr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install comtec-dr

## Usage

movファイルもしくはディレクトリを引数に取ることが出来ます

### CSVデータで取り出し

```
comtec_mov_to_csv /Volumes/NO\ NAME/DCIM/20171005_003/007_130755_G.MOV
```

```
comtec_mov_to_csv /Volumes/NO\ NAME/DCIM/20171005_003
```

### GPXデータで取り出し

```
comtec_mov_to_gpx /Volumes/NO\ NAME/DCIM/20171005_003/007_130755_G.MOV
```

```
comtec_mov_to_gpx /Volumes/NO\ NAME/DCIM/20171005_003
```
