#!/bin/bash

JAVA_HOME=/opt/bin32-jre
PATH=$PATH:/opt/bin32-jre/bin

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

dwb $@
