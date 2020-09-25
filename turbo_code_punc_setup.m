function turbo_code_punc_setup

%Get the parameter names are values from mask
mask_ws_vars = get_param([gcs '/Global Parameters'],'maskwsvariables');

if ~isempty(mask_ws_vars)
    for i = 1:length(mask_ws_vars),
       curr_var = mask_ws_vars(i).Name;
       evalin('base',[curr_var ' = ' num2str(mask_ws_vars(i).Value) ';']);
       
    end

%Set up other parameter in Matlab
evalin('base', 'trellis = poly2trellis(5, [37 21],37);');
evalin('base', 'code_rate = 1/3');
evalin('base', 'Ps = 1;');
evalin('base', 'EbNo = 10.0.^(0.1*EbNodB)');
evalin('base', 'EsNo = EbNo/code_rate;');
evalin('base', 'multiplier = 1/code_rate;');
evalin('base', 'Variance = Ps*multiplier/EsNo;');
evalin('base', 'clear code_rate Ps EbNo EsNO multiplier');

else
    evalin('base', 'Len= 44;');
    evalin('base', 'Iter = 11;');
end