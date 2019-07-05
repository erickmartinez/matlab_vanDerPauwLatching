function latchingRelayReset(app)
% Reset the state of all relays to the default normally closed (NC)
% position
%
% Parameters
% ----------
% app: obj
%   The handle of the app designer instance


    % Get the arduino handle
    a = app.handle_arduino;
    % Map the pins to use in order to change to the NO position
    pinsOff = {'D2','D4','D6','D8','A0'};
    % The period for generating the TTL pulse
    period = 0.001;
    fprintf('Reseting pins.\n');
    for i=1:5
        fprintf('Switch position %d off.\n',i);
        writeDigitalPin(a,pinsOff{i},0);
        pause(period);
        writeDigitalPin(a,pinsOff{i},1);
        pause(period);
        writeDigitalPin(a,pinsOff{i},0);
        pause(period);
        configurePin(a,pinsOff{i},'Unset');
    end 
    % Clear the variable pointing to the arduini handle
    clear a;
end