#define midi_deviceIn_count
//Returns the number of midi input devices
//can be called before midi_init()
return external_call(global._midi_deviceIn_count);
#define midi_deviceIn_name
//Returns the name of a midi input device
//argument0 - device #
//can be called before midi_init()
return external_call(global._midi_deviceIn_name,argument0);
#define midi_deviceOut_count
//Returns the number of midi output devices
//can be called before midi_init()
return external_call(global._midi_deviceOut_count);
#define midi_deviceOut_name
//Returns the name of a midi output device
//argument0 - device #
//can be called before midi_init()
return external_call(global._midi_deviceOut_name,argument0);
#define midi_input_init
//Begins recording midi data from specified midi input device
//argument0 - input device (midi_deviceIn_name)
//argument1 - play (true/false) play received data on receival
//can be called before midi_init()
return external_call(global._midi_input_init,argument0,argument1);
//returns whether successful 
#define midi_input_buffer_length
//Returns the length of the buffer, the buffer is a string of all data. The data is grouped
//into threes, so the length may be 10, but the buffer is actually 30 characters in length.
//The commands which are only two bytes in size are padded with a third null byte.
//can be called before midi_init()
return external_call(global._midi_buffer_length);

#define midi_input_get_buffer
//Returns the buffer, the buffer is a string of all data. The data is grouped
//into threes, so the length may be 10, but the buffer is actually 30 characters in length.
//The commands which are only two bytes in size are padded with a third null byte.

//can be called before midi_init()
return external_call(global._midi_buffer_length);

#define midi_input_exit
//Stops recording midi data from specified midi input device
//can be called before midi_init()
external_call(global._midi_input_exit);
#define midi_dll_init
//Midi Devices
global._midi_deviceIn_count=external_define("midi.dll","midi_deviceIn_count",dll_cdecl,ty_real,0)
global._midi_deviceIn_name=external_define("midi.dll","midi_deviceIn_name",dll_cdecl,ty_string,1,ty_real)
global._midi_deviceOut_count=external_define("midi.dll","midi_deviceOut_count",dll_cdecl,ty_real,0)
global._midi_deviceOut_name=external_define("midi.dll","midi_deviceOut_name",dll_cdecl,ty_string,1,ty_real)
global._midi_input_init=external_define("midi.dll","midi_input_init",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_input_exit=external_define("midi.dll","midi_input_exit",dll_cdecl,ty_real,0)
global._midi_input_buffer_length=external_define("midi.dll","midi_input_buffer_length",dll_cdecl,ty_real,0)
global._midi_input_get_buffer=external_define("midi.dll","midi_input_get_buffer",dll_cdecl,ty_string,0)
//Midi Init/Exit 
global._midi_init=external_define("midi.dll","midi_init",dll_cdecl,ty_real,1,ty_real)
global._midi_init_file=external_define("midi.dll","midi_init_file",dll_cdecl,ty_real,2,ty_string,ty_real)
global._midi_init_ext=external_define("midi.dll","midi_init_ext",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_init_dig=external_define("midi.dll","midi_init_dig",dll_cdecl,ty_real,2,ty_string,ty_real)
global._midi_exit=external_define("midi.dll","midi_exit",dll_cdecl,ty_real,0)
//Midi Notes
global._midi_note_play=external_define("midi.dll","midi_note_play",dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real)
global._midi_note_play_timed=external_define("midi.dll","midi_note_play_timed",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real)
global._midi_note_stop=external_define("midi.dll","midi_note_stop",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_command=external_define("midi.dll","midi_command",dll_cdecl,ty_real,2,ty_real,ty_string)
global._midi_volume_edit=external_define("midi.dll","midi_volume_edit",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_return_cmd=external_define("midi.dll","midi_return_cmd",dll_cdecl,ty_string,0)
//Midi Play
global._midi_add=external_define("midi.dll","midi_add",dll_cdecl,ty_real,1,ty_string)
global._midi_play=external_define("midi.dll","midi_play",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_stop_all=external_define("midi.dll","midi_stop_all",dll_cdecl,ty_real,0)
global._midi_pos_seek=external_define("midi.dll","midi_pos_seek",dll_cdecl,ty_real,1,ty_real)
global._midi_length_beats=external_define("midi.dll","midi_length_beats",dll_cdecl,ty_real,0)
global._midi_length_seconds=external_define("midi.dll","midi_length_seconds",dll_cdecl,ty_real,0)
global._midi_pos_beats=external_define("midi.dll","midi_pos_beats",dll_cdecl,ty_real,0)
global._midi_pos_seconds=external_define("midi.dll","midi_pos_seconds",dll_cdecl,ty_real,0)
//Midi Volume
global._midi_set_volume_local=external_define("midi.dll","set_volume_local",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_set_volume_global=external_define("midi.dll","set_volume_global",dll_cdecl,ty_real,2,ty_real,ty_real)
//Midi Write
global._midi_write_begin=external_define("midi.dll","midi_write_begin",dll_cdecl,ty_real,1,ty_string)
global._midi_write_end=external_define("midi.dll","midi_write_end",dll_cdecl,ty_real,0)
global._midi_write_MThd=external_define("midi.dll","midi_write_MThd",dll_cdecl,ty_real,1,ty_real)
global._midi_write_MTrk_begin=external_define("midi.dll","midi_write_MTrk_begin",dll_cdecl,ty_real,1,ty_real)
global._midi_write_MTrk_tempo=external_define("midi.dll","midi_write_MTrk_tempo",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_write_MTrk_instrument=external_define("midi.dll","midi_write_MTrk_instrument",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real)
global._midi_write_MTrk_noteON=external_define("midi.dll","midi_write_MTrk_noteON",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real)
global._midi_write_MTrk_noteOFF_all=external_define("midi.dll","midi_write_MTrk_noteOFF_all",dll_cdecl,ty_real,2,ty_real,ty_real)
global._midi_write_MTrk_noteOFF=external_define("midi.dll","midi_write_MTrk_noteOFF",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real)
global._midi_write_MTrk_end=external_define("midi.dll","midi_write_MTrk_end",dll_cdecl,ty_real,1,ty_real)
global._midi_write_MTrk_command=external_define("midi.dll","midi_write_MTrk_command",dll_cdecl,ty_real,3,ty_real,ty_real,ty_string)
global._midi_write_MTrk_size=external_define("midi.dll","midi_write_MTrk_size",dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real)
global._midi_write_record_begin=external_define("midi.dll","midi_write_record_begin",dll_cdecl,ty_real,0)
global._midi_write_record_end=external_define("midi.dll","midi_write_record_end",dll_cdecl,ty_real,1,ty_string)








#define midi_dll_free
external_free("midi.dll");
#define midi_init
//Initializes dll
//argument0 - window_handle()
external_call(global._midi_init,argument0)
#define midi_init_file
//Initializes dll
//argument0 - allegro cfg file
//argument1 - window_handle()
external_call(global._midi_init_file,argument0,argument1)
#define midi_init_ext
//Initializes dll
//argument0 - window_handle()
//argument1 - chosen midi device
/*
I recommend using -1, or -2
    -4 = none (pointless)
    -3 = digmid
    -2 = win32 MIDI mapper
    -1 = autodetect/default
    0  = device 0
    1  = device 1
    2  = device 2
    ...= deivce ...
*/
external_call(global._midi_init_ext,argument0,argument1)
#define midi_init_dig
//Initializes dll
//argument0 - patches
//argument1 - window_handle()
/*
This adds digmid functionality to this dll, but it may remove the ability to use midi_note functions. It
also renders my digmid.dll completely useless other then the fact that using both you are able use both midi_notes,
and digmid at the same time.
*/
external_call(global._midi_init_dig,argument0,argument1)
#define midi_note_play
//plays the sound according to instrument, pitch, volume and etc.
//double channel
//double pan
//double instrument
//double pitch
//double volume
external_call(global._midi_note_play,argument0,argument1,argument2,argument3,argument4)
#define midi_note_play_timed
//plays the sound according to instrument, pitch, volume and etc.
//double channel
//double pan
//double instrument
//double pitch
//double volume
//double timer
external_call(global._midi_note_play_timed,argument0,argument1,argument2,argument3,argument4,argument5)
#define midi_volume_edit
//edit volume of channel
//double channel
//double new volume
external_call(global._midi_volume_edit,argument0,argument1)
#define midi_note_stop
//stops currently playing note on channel with pitch
//double channel
//double pitch
external_call(global._midi_note_stop,argument0,argument1)
#define midi_command
//Used for executing custom commands
//double command_legnth
//char* command_data
external_call(global._midi_command,argument0,argument1)
#define midi_return_cmd
//Returns the latest normal midi command, no meta or sysex 
//It returns it in a string of 2 or 3 characters depending on command
return external_call(global._midi_return_cmd)
#define midi_stop_all
external_call(global._midi_stop_all)
#define midi_add
//midi file name
//returns an id, that can be used for playing
return external_call(global._midi_add,argument0)
#define midi_play
//argument0 - id
//argument1 - looped 
external_call(global._midi_play,argument0,argument1)
#define midi_length_beats
//Returns the current midi files length in beats
return external_call(global._midi_length_beats)
#define midi_pos_beats
//Returns the current midi files position in beats
return external_call(global._midi_pos_beats)
#define midi_length_seconds
//Returns the current midi files length in seconds
return external_call(global._midi_length_seconds)
#define midi_pos_seconds
//Returns the current midi files position in seconds
return external_call(global._midi_pos_seconds)
#define midi_pos_seek
//Seeks the position
//argument0 - double - beats
return external_call(global._midi_pos_seek,argument0)
//for return information http://alleg.sourceforge.net/stabledocs/en/alleg027.html#midi_seek
#define midi_set_volume_local
//sets the volume for "this" program only 
//argument0 - digi volume 
//argument1 - midi volume 
external_call(global._midi_set_volume_local,argument0,argument1)
#define midi_set_volume_global
//sets the volume for all programs (system volume)
//argument0 - digi volume 
//argument1 - midi volume 
external_call(global._midi_set_volume_global,argument0,argument1)
#define midi_exit
//Ends dll
external_call(global._midi_exit)
#define midi_write_record_begin
//Begins recording of all midi commands. It does not record midi file playing commands.
external_call(global._midi_write_record_begin);
#define midi_write_record_end
//Ends recording of all midi commands. It does not record midi file playing commands.
//argument0 - file to write in
external_call(global._midi_write_record_end,argument0);
#define midi_write_begin
//Opens/Creates midi file for writing
//argument0 - file name
//Returns whether successful
return external_call(global._midi_write_begin,argument0)
#define midi_write_end
//Closes written midi file
external_call(global._midi_write_end)
#define midi_write_MThd
//Writes the MThd chunk to the midi file. This is written before the MTrk chunk(s).
//argument0 - Pulses per quarter note (PPQN)
/*
    The number is how many pulses would be in a single quarter note. For
    an example: if argument0 were 960, then when timing notes, 960 would be
    a quarter-note, 480 would be an eigth-note, and 1920 would be a half-note.
    960 is a very good number to use, as it can be divided easily for short notes.
*/
external_call(global._midi_write_MThd,argument0)
#define midi_write_MTrk_begin
//Begins the writing of an MTrk chunk, which follows the MThd chunk. This dll uses format 0,
//so there is only 1 MTrk chunk. 
//argument0 - Length in bytes of the MTrk chunk.
/*
    You must calculate the total size of the chunk in bytes before writing the chunk,
    so use the function "MTrk_size()" which can be used to easily calculate the size.
*/
return external_call(global._midi_write_MTrk_begin,argument0)
#define midi_write_MTrk_tempo
//Writes the tempo, or ammount of time between each quarter note 
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
//argument1 - microseconds in between each quarter-note. 
/*
    For example 250000 would equal 240 quater-notes per minute, and 1000000 would be 1 quarter note per second.
    By default it is set to 500000 or 120 quarter notes per second.  
*/
return external_call(global._midi_write_MTrk_tempo,argument0,argument1)
//writes 8 bytes
#define midi_write_MTrk_instrument
//Writes the instrument for a channel
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
//argument1 - channel (0-16)
//argument2 - instrument (0-174) Note that instruments above 127 work only correctly on channel 9. The instrument is 0 by default. 

return external_call(global._midi_write_MTrk_instrument,argument0,argument1,argument2)
//writes 4 bytes
#define midi_write_MTrk_noteON
//Writes a command to play a note
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
//argument1 - channel (0-16)
//argument2 - note (0-128), middle C is 60.
//argument3 - volume (0-128)
return external_call(global._midi_write_MTrk_noteON,argument0,argument1,argument2,argument3)
//writes 5 bytes
#define midi_write_MTrk_noteOFF
//Writes a command to stop a note 
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
//argument1 - channel (0-16)
//argument2 - note (0-128), middle C is 60.
return external_call(global._midi_write_MTrk_noteOFF,argument0,argument1,argument2)
//writes 5 bytes
#define midi_write_MTrk_noteOFF_all
//Writes a command to stop all notes on a channel
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
//argument1 - channel (0-16)
return external_call(global._midi_write_MTrk_noteOFF_all,argument0,argument1)
//writes 5 bytes
#define midi_write_MTrk_command
//Writes a custom command
//argument0 - delta time
//argument1 - double Length bytes/characters.
//argument2 - char* A string with the command data. Use "chr" for the commands
    //Commands are a series of numbers (0-256) stored in a string in single characters
    //This allows for custom commands
return external_call(global._midi_write_MTrk_command,argument0,argument1,argument2)
//writes x bytes
//returns total written length
#define midi_write_MTrk_end
//Writes a command to end the MTrk chunk, and in format 0 the song
//argument0 - delta time
/*
    argument0 is the amount of PPQN (described in the script "midi_write_MThd"), that should be waited 
    until executing the specified command (ex. Stop a note). If 0 is specified then the command would happen 
    immediately and if the PPQN is specified, then it would wait the ammount of microseconds specified in 
    argument1 of "midi_write_MTrk_tempo()", when executed. 
*/
return external_call(global._midi_write_MTrk_end,argument0)
//writes 5 bytes
#define midi_write_MTrk_size
//Use this function to calculate the size of the MTrk chunk before or when calling "midi_write_MTrk_begin()". 
//For the arguments, enter how many times a write function will be executed; * The actual value in bytes is also
//specified if you wish to add the size manually.

//argument0 - midi_write_MTrk_tempo         *8 bytes
//argument1 - midi_write_MTrk_instrument    *4 bytes
//argument2 - midi_write_MTrk_noteON        *5 bytes
//argument3 - midi_write_MTrk_noteOFF       *5 bytes
//argument4 - midi_write_MTrk_noteOFF_all   *5 bytes
//argument5 - midi_write_MTrk_end           *5 bytes
//argument6 - any, use this for adding to the rest
//Returns the ammount of bytes

return external_call(global._midi_write_MTrk_size,argument0,argument1,argument2,argument3,argument4,argument5,argument6);
