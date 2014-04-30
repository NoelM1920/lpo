%simulation - connects the TX, channel model and the RX

clear
clc

%Loads TX and RX parameters:
sdrSettingsSave;

%Simulation parameters-----------------------------------------------------
timingOffset = 20;      %timing offset in % in the channel
nGain = 0.2;            %Noise gain
fp = 1;                 %Fading profile frequency
fg = .75;                 %Fading profile gain (in %)
%--------------------------------------------------------------------------

%Transmitter---------------------------------------------------------------
sdrTX;

%Channel-------------------------------------------------------------------
corruptSig = channelModel(txSig, energy, oversample, timingOffset, nGain,...
                          fp, fg);

%Receiver------------------------------------------------------------------
sdrRX;

%Results-------------------------------------------------------------------

e = 100*bitErrorRate(msg, rxBits);

fprintf('BER: %2.2f%%. \n', e);
fprintf('Allignment offset: %d.\n', allignOffset);
fprintf('Frame offset: %d.\n', delay);
