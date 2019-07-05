function latchingRelayToggleState(app,switchPositon)
% Switch the state according to switching described in ASTM F76.12340
% method for van der Pauw method (page 4). 
% *************** Important *****************************************
% All relays need to set to normally open position (use latchingRelayReset
% beforehand).
% Parameters
% ----------
% app: obj
%   A handle to the app designer GUI instance
% switchPosition: int
%   The position described in ASTM F76.12340 (from 1 to 6)
   
    % Get the arduino handle
    a       = app.handle_arduino;
    % Map the pins to use in order to change to the NC position
    pinsOn  = {'D3','D5','D7','D9','A1'};
    % The period for generating the TTL pulse
    period = 0.001;

    fprintf('*** Turning pins on ***\n');
    for i=1:switchPositon
        if i>1
            fprintf('Switch position %d on.\n',i-1);
            writeDigitalPin(a,pinsOn{i-1},0);
            pause(period);
            writeDigitalPin(a,pinsOn{i-1},1);
            pause(period);
            writeDigitalPin(a,pinsOn{i-1},0);
            pause(period);
            configurePin(a,pinsOn{i-1},'Unset');
        end
    end
    % Clear the variable pointing to the arduini handle
    clear a;
end

