clc
clear

graphics_toolkit qt
pkg load signal
pkg load ltfat
%Άξονες για τη προβολή FFT του πρωτότυπου και επεξεργασμένου σήματος
%%%%%%%%%%%%%%%%
h.original_axes = axes ("xlim", [0 2e4],"position", [0.05 0.68 0.8 0.2]);

h.modified_axes = axes ("xlim", [0 2e4],"position", [0.05 0.05 0.8 0.2]);
%%%%%%%%%%%%%%%%

%Sliders και pushbuttons στο GUI
%%%%%%%%%%%%%%%%
h.plot_title_edit = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string","Insert Music File",
                               "position", [0.05 0.90 0.45 0.06]);

h.browse_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Browse",
                                "callback", @browse_Callback,
                                "position", [0.51 0.90 0.15 0.06]);
h.play_original_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Play Original",
                                "callback", @play_original_Callback,
                                "position", [0.67 0.90 0.15 0.06]);

h.restore_original_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Restore",
                                "callback", @restore_original_Callback,
                                "position", [0.83 0.90 0.15 0.06]);

h.pause_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Pause",
                                "callback", @original_pause_Callback,
                                "position", [0.85 0.80 0.15 0.06]);
h.stop_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Stop",
                                "callback", @stop_Callback,
                                "position", [0.85 0.74 0.15 0.06]);


h.apply_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Apply",
                                "callback", @apply_Callback,
                                "position", [0.75 0.5 0.15 0.06]);
h.play_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Play",
                                "callback", @play_Callback,
                                "position", [0.75 0.43 0.15 0.06]);

h.preset1_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Preset1",
                                "callback", @preset1_Callback,
                                "position", [0.90 0.43 0.1 0.05])
h.preset2_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Preset2",
                                "callback", @preset2_Callback,
                                "position", [0.90 0.36 0.1 0.05])

h.export_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Export",
                                "callback", @export_Callback,
                                "position", [0.75 0.36 0.15 0.06]);


h.freq1_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "60 Hz",
                           "horizontalalignment", "left",
                           "position", [0.04 0.30 0.07 0.05]);

h.freq1_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.05 0.35 0.04 0.25]);

h.freq2_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "310 Hz",
                           "horizontalalignment", "left",
                           "position", [0.14 0.30 0.07 0.05]);

h.freq2_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.15 0.35 0.04 0.25]);

h.freq3_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "600 Hz",
                           "horizontalalignment", "left",
                           "position", [0.24 0.30 0.07 0.05]);

h.freq3_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.25 0.35 0.04 0.25]);

h.freq4_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "1e3 Hz",
                           "horizontalalignment", "left",
                           "position", [0.34 0.30 0.07 0.05]);

h.freq4_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.35 0.35 0.04 0.25]);

h.freq5_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "3e3 Hz",
                           "horizontalalignment", "left",
                           "position", [0.44 0.30 0.07 0.05]);


h.freq5_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.45 0.35 0.04 0.25]);

h.freq6_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "12e3 Hz",
                           "horizontalalignment", "left",
                           "position", [0.54 0.30 0.07 0.05]);


h.freq6_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.55 0.35 0.04 0.25]);


h.freq7_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "16e3 Hz",
                           "horizontalalignment", "left",
                           "position", [0.64 0.30 0.07 0.05]);

h.freq7_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 7, 'Min', -7,
                            "value", 0,
                            "callback", @slider1_Callback,
                            "position", [0.65 0.35 0.04 0.25]);




h.pitch_slider_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "Pitch",
                           "horizontalalignment", "left",
                           "position", [0.913 0.23 0.05 0.06]);

h.pitch_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 6, 'Min', -6,
                            "value", 0,
                            "callback", @pitch_Callback,
                            "position", [0.87 0.20 0.12 0.04]);
h.time_slider_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "Time",
                           "horizontalalignment", "left",
                           "position", [0.913 0.13 0.05 0.06]);

h.time_slider = uicontrol ("style", "slider",
                            "units", "normalized",
                            "string", "slider",
                            'Max', 2, 'Min', 0.5,
                            "value", 1,
                            "callback", @time_Callback,
                            "position", [0.87 0.10 0.12 0.04]);

%%%%%%%%%%%%%%%%
guidata (gcf, h)
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
set(gcf, 'Position', [10, 10, 900 ,600])


global s Fs % s=signal, Fs=Sampling Freq
global nc = 7 % αριθμός των sliders
global f % οι κεντρικες συχνότητες για το ΕQ
global filts_type % To είδος των φίλτρων
global output % Το επεξεργασμένο σήμα
global G % Τα Gains(θετικά ή αρνητικά) του EQ
global pausing % BOOL Μεταβλητή για το αν έχουμε πατήσει το pause ή όχι
global player; % Global player για την αναπαραγωγή ήχων

% Αρχικοποιήσεις
pausing= 0;
G = 0*ones(1,nc);
filts_type=[1 2*ones(1,nc-2) 3];
f=[60 310 600 1e3 3e3 12e3 16e3];


% --- Εκτελείτε όταν πατάμε το κουμπί browse
function browse_Callback(hObject, eventdata, handles)
h = guidata (hObject);
%Επιλογή αρχείου με τη βοήθεια του GUI
[FileName,PathName,FilterIndex] = uigetfile({'*.mp3;*.wav;*.wma;*.avi;*.mpg','media files (*.mp3,*.wav,*.wma,*.avi,*.mpg)';'*.*',  'All Files (*.*)'},'File Selector') ;
isok=true;
if length(FileName)==1
     if FileName==0
         isok=false;
     end
end
if isok
    fln=[PathName FileName];
    set(h.plot_title_edit, 'string', FileName); % Αλλαγή του κειμένου στο GUI με το όνομα του αρχείου που έχουμε εισάγει.
    drawnow;
    read_audio(fln); % Εισαγωγή ήχου/σήματος

    % Ανανέωση των τιμών στο διάγραμμα
    [x y] = update_original_plot();
    plot(h.original_axes,x(1:100:length(x)),y(1:100:length(y)));

    set(h.original_axes,"xlim", [0 2e4])


end
end

% --- Εκτελείτε όταν πατάμε το κουμπί apply
function apply_Callback(hObject, eventdata, handles)
  h = guidata(hObject);
  global nc
  global s
  global output
  output = s;
  % Κάνουμε την παρακάτω διαδικασία για όλες τις κεντρικές συχνότητες
  for n = 1:nc
    [b a] = calculate_coeff(n) % Υπολογισμός παραγώντων για τα φίλτρα
    output = filter(b, a, output); % Εφαρμογή φίλτρου
  endfor
  disp("Filters Applied");

  % Ανανέωση διαγράμματος FFT επεξεργασμένου σήματος
  [x y] = update_modified_plot();
  plot(h.modified_axes,x(1:100:length(x)),y(1:100:length(y)));



  set(h.modified_axes,"xlim", [0 2e4])
end

% --- Εκτελείτε όταν κινούμε κάποιο Slider
function slider1_Callback(hObject, eventdata, handles)
  global G
  h = guidata (hObject);
  % Εδώ συλλέγουμε τις τιμές των Gain από τα sliders
  switch(gcbo)
    case{h.freq1_slider}
    G(1) = get(h.freq1_slider,"value");
    case{h.freq2_slider}
    G(2) = get(h.freq2_slider,"value");
    case{h.freq3_slider}
    G(3) = get(h.freq3_slider,"value");
    case{h.freq4_slider}
    G(4) = get(h.freq4_slider,"value");
    case{h.freq5_slider}
    G(5) = get(h.freq5_slider,"value");
    case{h.freq6_slider}
    G(6) = get(h.freq6_slider,"value");
    case{h.freq7_slider}
    G(7) = get(h.freq7_slider,"value");
    endswitch
end
% --- Εκτελείτε όταν πατάμε το κουμπί play
function play_Callback(hObject, eventdata, handles)
  global output;
  global player;
  global Fs;
  % Αναπαραγωγή του επεξεργασμένου ήχου
  player = audioplayer(output, Fs)
  play(player)
end
% --- Εκτελείτε όταν πατάμε το κουμπί Play Original
function play_original_Callback(hObject, eventdata, handles)
  global s;
  global player;
  global Fs;
  % Αναπαραγωγή του πρωτότυπου ήχου
  player = audioplayer(s, Fs)
  play(player)
end;

%--- Συνάρτηση για την ανανέωση του FFT διάγραμματος για το πρωτότυπο σήμα
function [x1 y1 x2 y2] = update_original_plot()
  global s
  global Fs
  N = numel(s);
  T  = 1/Fs;
  deltaF = Fs/N;
  Y = fft(s);
  Y = abs(Y/N);
  Amp = [Y(ceil(end/2)+1:end)' Y(1) Y(2:ceil(end/2))']';
  if (mod(N,2) == 0)
    sampleIndex = -N/2:1:N/2-1;
  else
    sampleIndex = -(N-1)/2:1:(N-1)/2;
  end
  x1 = deltaF*sampleIndex; y1 = 20*log10(Amp);

  idx = find(Amp.^2 > 15);
  idx(sampleIndex(idx) < 0) = [];
  x2 = deltaF*sampleIndex(idx); y2= 20*log10(Amp(idx));
end
%--- Συνάρτηση για την ανανέωση του FFT διάγραμματος για το επεξεργασμένο σήμα
function [x y] = update_modified_plot()
  global output
  global Fs
  N = numel(output);
  T  = 1/Fs;
  deltaF = Fs/N;
  Y = fft(output);
  Y = abs(Y/N);
  Amp = [Y(ceil(end/2)+1:end)' Y(1) Y(2:ceil(end/2))']';
  if (mod(N,2) == 0)
    sampleIndex = -N/2:1:N/2-1;
  else
    sampleIndex = -(N-1)/2:1:(N-1)/2;
  end
  x = deltaF*sampleIndex; y = 20*log10(Amp);
end
% --- Εκτελείτε όταν πατάμε το κουμπί Pause
function original_pause_Callback(hObject, eventdata, handles)
  global player;
  global pausing;
  if pausing == 0
    pause(player);
    pausing = 1;
  elseif pausing == 1
    resume(player)
    pausing = 0;
    endif
  end;
% --- Εκτελείτε όταν πατάμε το κουμπί Stop
function stop_Callback(hObject, eventdata, handles)
  global player;
  stop(player)
end

% --- Εκτελείτε όταν κουνάμε το Pitch Slider
function pitch_Callback(hObject, eventdata, handles)
  global output;
  h = guidata (hObject);
  get(h.pitch_slider,"value")
  output = pitch(output, get(h.pitch_slider,"value"));
end
% --- Εκτελείτε όταν κουνάμε το Time Slider
function time_Callback(hObject, eventdata, handles)
  global output;
  h = guidata (hObject);
  output = time(output,get(h.time_slider,"value"));
end
% --- Εκτελείτε όταν πατάμε το κουμπί Export
function export_Callback(hObject, eventdata, handles)
  global output;
  global Fs;
  audiowrite("modified.wav", output, Fs);
end
% --- Εκτελείτε όταν πατάμε το κουμπί Restore
function restore_original_Callback(hObject, eventdata, handles)
  global s;
  global output;
  output = s;
end
% --- Εκτελείτε όταν πατάμε το κουμπί Preset1
function preset1_Callback(hObject, eventdata, handles)
h = guidata (hObject);
set(h.freq1_slider,"value", -7);

set(h.freq2_slider,"value", -7);

set(h.freq3_slider,"value", 0 );

 set(h.freq4_slider,"value", 3);

set(h.freq5_slider,"value",0);

set(h.freq6_slider,"value",7);

set(h.freq7_slider,"value",4);

end
% --- Εκτελείτε όταν πατάμε το κουμπί Preset2
function preset2_Callback(hObject, eventdata, handles)
h = guidata (hObject);
set(h.freq1_slider,"value", 0);

set(h.freq2_slider,"value", 0);

set(h.freq3_slider,"value", 2);

 set(h.freq4_slider,"value", 4);

set(h.freq5_slider,"value",-7);

set(h.freq6_slider,"value",7);

set(h.freq7_slider,"value",0);

  end
