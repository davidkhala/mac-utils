uninstall8(){
  sudo rm -fr /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
  sudo rm -fr /Library/PreferencesPanes/JavaControlPanel.prefPane
  sudo rm -fr ~/Library/Application\ Support/Oracle/Java
}
$@
