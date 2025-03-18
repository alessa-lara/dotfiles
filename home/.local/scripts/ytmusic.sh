echo "Insert youtube music PO token (github.com/yt-dlp/yt-dlp/wiki/PO-Token-Guide#po-token-for-player): "
read pot
echo "\n Insert youtube music songs or playlists to download: "
read music
yt-dlp --extractor-args "youtube:po_token=web_music.gvs+$pot" -x -f "bestaudio" "$music"
