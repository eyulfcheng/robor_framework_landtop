This File is prepare for Bo-Yu to interview.
1.下載對應的ChromeDriver，並放至以下路徑：
C:/Windows/System32/

2.使用power shell 或CMD下載python套件:
$ pip install robotframework
$ pip install robotframework-selenium2library

#如果出現錯誤，請卸載python並重新安裝python3
https://www.python.org/downloads/
#並將指令pip改成pip3

3. 確認是否安裝成功 
$ robot --version

3.5注意!!腳本並未填寫帳號密碼!

4.執行
robot landtop_buy.robot

5.可以透過report.html跟log.html測試結果
