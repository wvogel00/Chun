import Graphics.UI.WX
import Graphics.UI.WX.Menu

main = start chun

chun :: IO () -- GUI
chun = do
	menubar <- myMenuBar
	f <- frame [text := "Chun"]
	p <- panel f [on paint := paintInitTweet]
	t <- timer f [interval := 10000 , on command := reloadTweet p]
	set p [ on click := (\pt -> tweetClick p pt),
			on clickRight := (\pt -> tweetMenu p pt)]
	set f menubar
	set f [layout := minsize (sz 800 600) $ widget p ]

paintInitTweet :: DC () -> Rect -> IO ()
paintInitTweet dc rect = do
	--oAuthを使ってtweetを取得、初期状態を描画する
	return ()

reloadTweet :: Panel () -> IO ()
reloadTweet p = do
	--oAuthを使って最新のツイートを取得、状態を更新する
	return ()

tweetClick :: Panel () -> Point -> IO ()
tweetClick p pt = do
	--clickされた位置のツイートの情報を描画する
	return ()

tweetMenu :: Panel () -> Point -> IO ()
tweetMenu p pt = do
	--clickされたツイートに対するメニューを開く
	return ()


--メニューバー
myMenuBar = do
	file <- menuPane [text := "メニュー"]
	mFavList <- menuItem file [text := "お気に入りを開く"]
	mList <- menuItem file [text := "リストを開く"]
	mClose <- menuItem file [text := "終了する"]

	bHelp <- menuPane [text:="ヘルプ"]
	mVersion <- menuItem bHelp [text := "バージョン情報",
								help := "version info."]
	mHelp <- menuItem bHelp [text := "ヘルプ",
							 help := "how to use application"]

	return [ menuBar := [file,bHelp]
			,on (menu mClose):= return ()
			,on (menu mFavList) := return ()
            ,on (menu mList) := return ()
			,on (menu mHelp) := return ()
			,on (menu mVersion) := return ()]
