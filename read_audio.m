function read_audio(fln)
global s Fs


if exist(fln,'file')~=0

    [s_stereo Fs] = audioread(fln); %Εισαγωγή ήχου
    s = (s_stereo(:,1) + s_stereo(:,2))/2; % Μετατροπή ήχουν από stereo σε mono


else
    error('file not exist');
end
