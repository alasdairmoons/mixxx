#
# Options (select one audio driver and one midi driver)
#

# PortAudio (Working good)
SOURCES += playerportaudio.cpp
HEADERS += playerportaudio.h
DEFINES += __PORTAUDIO__
unix:LIBS += -lportaudio
win32:LIBS += ../lib/PAstaticWMMED.lib winmm.lib

# OSS Midi (Working good, Linux specific)
#SOURCES += midiobjectoss.cpp
#HEADERS += midiobjectoss.h
#DEFINES += __OSSMIDI__

# PortMidi (Alpha - Linux ALSA, Windows and MacOS X)
SOURCES += midiobjectportmidi.cpp
HEADERS += midiobjectportmidi.h
DEFINES += __PORTMIDI__
unix:LIBS += -lportmidi -lporttime
macx:LIBS -= -lporttime
win32:LIBS += ../lib/portmidi.lib ../lib/porttime.lib

# ALSA PCM (Not currently working, Linux specific)
#SOURCES += playeralsa.cpp
#HEADERS += playeralsa.h
#DEFINES += __ALSA__
#unix:LIBS += -lasound

# ALSA MIDI (Not currently working, Linux specific)
#SOURCES += midiobjectalsa.cpp
#HEADERS += midiobjectalsa.h
#DEFINES  += __ALSAMIDI__

#
# End of options
#

SOURCES	+= configobject.cpp fakemonitor.cpp controllogpotmeter.cpp controlobject.cpp controlnull.cpp controlpotmeter.cpp controlpushbutton.cpp controlrotary.cpp dlgchannel.cpp dlgplaycontrol.cpp dlgplaylist.cpp dlgmaster.cpp dlgcrossfader.cpp dlgsplit.cpp dlgpreferences.cpp enginebuffer.cpp engineclipping.cpp enginefilterblock.cpp enginefilteriir.cpp engineobject.cpp enginepregain.cpp enginevolume.cpp main.cpp midiobject.cpp mixxx.cpp mixxxdoc.cpp mixxxview.cpp player.cpp soundsource.cpp soundsourcemp3.cpp soundsourcewave.cpp monitor.cpp enginechannel.cpp enginemaster.cpp wknob.cpp wbulb.cpp wplaybutton.cpp wwheel.cpp wslider.cpp wplayposslider.cpp enginedelay.cpp
HEADERS	+= configobject.h fakemonitor.h controllogpotmeter.h controlobject.h controlnull.h controlpotmeter.h controlpushbutton.h controlrotary.h defs.h dlgchannel.h dlgplaycontrol.h dlgplaylist.h dlgmaster.h dlgcrossfader.h dlgsplit.h dlgpreferences.h enginebuffer.h engineclipping.h enginefilterblock.h enginefilteriir.h engineobject.h enginepregain.h enginevolume.h midiobject.h mixxx.h mixxxdoc.h mixxxview.h player.h soundsource.h soundsourcemp3.h soundsourcewave.h monitor.h enginechannel.h enginemaster.h wknob.h wbulb.h wplaybutton.h wwheel.h wslider.h wplayposslider.h enginedelay.h

unix {
  DEFINES += __UNIX__
  UI_DIR = .ui
  MOC_DIR = .moc
  OBJECTS_DIR = .obj
  LIBS += -lmad -lid3tag -lsndfile
  QMAKE_CXXFLAGS += -O -dD
  CONFIG_PATH = \"/usr/share/mixxx\"
}

win32 {
  DEFINES += __WIN__
  INCLUDEPATH += ../portmidi/
  #INCLUDEPATH += ../mad-0.14.2b/libid3tag
  INCLUDEPATH += ../mad-0.14.2b
  INCLUDEPATH += ../portaudio/pa_common
  INCLUDEPATH += .
  LIBS += ../lib/libmad.lib 
  #../lib/libid3tag.lib ../lib/libz.lib
  QMAKE_CXXFLAGS += -GX
  QMAKE_LFLAGS += /NODEFAULTLIB:libcd /NODEFAULTLIB:libcmtd /NODEFAULTLIB:msvcrt.lib
  CONFIG_PATH = \"d:\\mixxx\"
}

macx {
  DEFINES += __MACX__
}

# Profiling
#QMAKE_CXXFLAGS_DEBUG += -pg
#QMAKE_LFLAGS_DEBUG += -pg

DEFINES += CONFIG_PATH=$$CONFIG_PATH
FORMS	= dlgchanneldlg.ui dlgplaycontroldlg.ui dlgplaylistdlg.ui dlgmasterdlg.ui dlgcrossfaderdlg.ui dlgsplitdlg.ui dlgpreferencesdlg.ui
IMAGES	= filesave.xpm
TEMPLATE	=app
TRANSLATIONS = mixxx_de.ts
CONFIG	+= qt warn_on thread debug 
DBFILE	= mixxx.db
LANGUAGE	= C++
