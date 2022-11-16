# **Bearbnb**
這是世界上最小的旅遊租房網站

## **Authors**
宜陽 F., C.N.Chen, Ricky Cheng, F.L.Wu, Aloe Peng

## **Installation**
1. 使用 *Git bash* 在要下載 repository 的目錄下依序輸入以下指令

       git clone https://github.com/s107062597GmailCom/bearbnb.git

       mkdir bearbnb/src/main/resources

       cp bearbnb/configurations/application.properties bearbnb/src/main/resources/

       mkdir bearbnb/src/main/java/team/lazybear/bearbnb/config

       cp bearbnb/configurations/MainConfig.java bearbnb/src/main/java/team/lazybear/bearbnb/config/

1. 開啟 Eclipse → 'File' → 'Import' → 'Maven' → 'Existing Maven Projects' → 'Root Directory' → 選擇剛剛下載的 'bearbnb' 資料夾 → Finish

1. 依自己的環境設定 application.properties 檔案

1. 依自己的環境設定 team.lazybear.bearbnb.config package 下的 MainConfig.java 檔案

1. 安裝完成


## **Usage**
因為本專案有用到 Google Map API，所以需要先輸入 google api key
1. 請先參考[網頁](https://medium.com/front-end-augustus-study-notes/google-map-api-1-a4e794b0162f)，並依教學申請自己的Google API key
1. 確保 Key 已經開通，可用以下網址測試："https://maps.googleapis.com/maps/api/distancematrix/json?key=<google api key>&origins=25.04790264833018,121.45083088633925%7C25.0340455,121.5499613%7C25.0351784,121.5501498%7C25.0401289,121.5493353%7C25.0395433,121.5537799%7C25.0557778,121.547999%7C25.0497015,121.5243148%7C25.041988,121.513329%7C25.0662737,121.5250459%7C25.0459966,121.5912019&destinations=25.04790264833018,121.45083088633925%7C25.0340455,121.5499613%7C25.0351784,121.5501498%7C25.0401289,121.5493353%7C25.0395433,121.5537799%7C25.0557778,121.547999%7C25.0497015,121.5243148%7C25.041988,121.513329%7C25.0662737,121.5250459%7C25.0459966,121.5912019&mode=driving"
1. 修改 src/main/java/team/lazybear/bearbnb/config/GLobalConfig.java 的 public static final String GoogleMapKey = "" 為 public static final String GoogleMapKey = "{your key}"
1. 修改 src/main/webapp/scripts/key.js 的 const GLOBAL_GOOGLE_API_KEY = ""; 為 const GLOBAL_GOOGLE_API_KEY = "{your key}";

## **Notes**

## **About**

## **License**
MIT License

Copyright ⓒ 2022 s107062597GmailCom
