function loadFileConfiguration(app,file,path)
% This function loads the acquisition parameters from a previous
% measurements.
% Parameters
% ----------
% app: object
%   A handle to the app designer instance
% file: string
%   The name of the file to load the parameters from
% path: string
%   The path to the file

    fileName = fullfile(path,file);
    if isfile(fileName)
        mf = matfile(fileName);
        try
            state = mf.state;
        
            if strcmp(state.Path,'')
                app.DirectoryTextArea.Value     = pwd;
            else
                app.DirectoryTextArea.Value     = state.Path;
            end
            app.FileTagEditField.Value      = state.FileTag;
            app.FrequencyHzEditField.Value  = state.Freq;
            app.AmplitudeAEditField.Value   = state.Amplitude;
            app.AveragesEditField.Value     = state.Averages;
            app.GateSwitch.Value            = state.Gated;
            app.VgstartVEditField.Value     = state.BiasStart;
            app.VgendVEditField.Value       = state.BiasStop;
            app.VgstepVEditField.Value      = state.BiasStep;
            app.CyclesEditField.Value       = state.Cycles;
            app.ReverseSwitch.Value         = state.Reverse;
            app.TimesEditField.Value        = state.Time;
        catch err
            err_msg = strrep(getReport(err), '\', '\\');
            fprintf('Error loading values.\n');
            fprintf('\n');
            fprintf(err_msg);
        end
    else
        fprintf('File was not loaded.\n');
    end
end