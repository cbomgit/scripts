#!/usr/bin/env python3.3

import os
import i3
import sys
import operator

workspaces=i3.get_workspaces()


def switch_workspace(opr, lower, upper):

    ops={"+":operator.add,"-":operator.sub} 

    #do the operation
    new_ws=ops[opr](focused_ws_num(),1) 
    
    #wrap around if necessary
    if new_ws > upper:
        new_ws = lower
    elif new_ws < lower:
        new_ws = upper
 
    cmd="workspace number %s" % new_ws
    i3.command(cmd)

def focused_ws_num():
    for workspace in workspaces:
        if workspace['focused']:
            return int(workspace['name'].split(':')[0])

def focused_output():
    for workspace in workspaces:
        if workspace['focused']:
            return workspace['output']

#####BODY################

#don't do anything if no operator argument has been passed
if len(sys.argv) != 2:
    print("Need to pass an operator argument")
    exit()

#call switch_workspace with upper and lower bounds based on connected screens
if os.popen('''xrandr | grep "HDMI1 connected"''').read() == "" and \
   os.popen('''xrandr | grep "VGA1 connected"''').read() == ""  :
    switch_workspace(sys.argv[1], 0, 9)
else:
    #upper and lower bounds depends on the screen
    if focused_output() == "LVDS1":
        switch_workspace(sys.argv[1], 5, 9)
    else:
        switch_workspace(sys.argv[1], 0, 4)
